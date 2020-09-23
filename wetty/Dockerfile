FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    less \
    python3 \
    sshpass \
    time \
    vim \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/log/*

RUN useradd -m -s /bin/bash gen3 && \
    ( echo "gen3:gen3" | chpasswd )

COPY . /home/gen3/
RUN chown -R gen3:gen3 /home/gen3
WORKDIR /home/gen3
USER gen3

RUN /bin/rm -rf node_modules \
    && npm config set unsafe-perm=true && npm ci

EXPOSE 3000
CMD ["npm", "start"]
