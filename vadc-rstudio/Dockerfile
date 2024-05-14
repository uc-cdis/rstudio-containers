FROM docker.io/rocker/rstudio:4

RUN apt-get update && apt-get install -y \
        libfontconfig1-dev \
        libfreetype6-dev \
        libfribidi-dev \
        libgit2-dev \
        libharfbuzz-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff5-dev \
        libxml2-dev \
        unixodbc-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./install-msodbcsql18.sh /tmp/install-msodbcsql18.sh
RUN /tmp/install-msodbcsql18.sh \
    && rm /tmp/install-msodbcsql18.sh

RUN install2.r --error \
    --deps TRUE \
    tidyverse \
    devtools \
    odbc \
    && rm -rf /tmp/downloaded_packages

EXPOSE 8787
CMD ["/init"]
