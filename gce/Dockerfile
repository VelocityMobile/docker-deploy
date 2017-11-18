FROM google/cloud-sdk:alpine

RUN apk update
RUN apk add tar

RUN set -x && \
    VER="17.09.0-ce" && \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
    tar -xzf /tmp/docker-$VER.tgz -C /tmp && \
    mv /tmp/docker/* /usr/bin
