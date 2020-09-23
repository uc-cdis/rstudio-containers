FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    ca-certificates \
    curl \
    git \
    openssh-server \
    python3 \
    sshpass \
    time \
    tmux \
    vim \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd && rm -rf /var/log/* && ln -sf /dev/stdout /var/log/lastlog

#RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
#RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd -m -s /bin/bash gen3 && \
    ( echo "gen3:gen3" | chpasswd )

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
