FROM quay.io/cdis/rocker-rstudio:4.1.0

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  openssl \
  unixodbc-dev \
  libssl-dev \
  libssh2-1-dev \
  libpq-dev \
  vim \
  && apt-get clean

RUN install2.r --error \
    --deps TRUE \
    tidyverse \
    dplyr \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools

RUN groupadd -r -g 1001 user && useradd -r -g user -u 1001 user
WORKDIR /home/user
EXPOSE 8787
CMD ["/init"]

RUN usermod -a -G users rstudio
RUN echo '#!/usr/bin/with-contenv bash \
          \n## load /etc/environment vars first: \
          \n for line in $( cat /etc/environment ) ; do export $line ; done \
          \n cp /etc/rstudio/rserver.conf /etc/rstudio/rserver.conf.bak \
          \n cat /etc/rstudio/rserver.conf.bak | grep -v www-frame-origin > /etc/rstudio/rserver.conf \
          \n echo www-frame-origin=${WWW_FRAME_ORIGIN} >> /etc/rstudio/rserver.conf \
          \n exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0' \
          > /etc/services.d/rstudio/run
