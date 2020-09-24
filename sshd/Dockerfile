FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y \
    apt-transport-https \
    apt-utils \
    build-essential \
    ca-certificates \
    curl \
    dnsutils \
    ftp \
    gcc \
    gettext-base \
    git \
    groff \
    jq \
    less \
    openssh-client \
    openssh-server \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    time \
    tmux \
    unzip \
    vim \
    wget \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/log/*

RUN mkdir /var/run/sshd \
  && touch /var/log/lastlog \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3 100 \
  && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 100

#RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
#RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
COPY ./docker-start.sh /docker-start.sh

RUN useradd -m -s /bin/bash gen3 && \
    ( echo "gen3:gen3" | chpasswd )

EXPOSE 22
CMD ["/bin/bash", "/docker-start.sh"]
