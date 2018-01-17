FROM alpine:latest
RUN apk -v --no-cache add \
        tar \
        sudo \
        jq \
        gnupg \
        make \
        expect \
        g++ \
        openssh \
        openssl \
        openssl-dev \
        curl \
        bash \
        git \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py-pip

VOLUME /root/.aws
VOLUME /project

WORKDIR /project

ADD https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl

RUN set -x && curl -O https://www.agwa.name/projects/git-crypt/downloads/git-crypt-0.6.0.tar.gz && \
      tar -zxf git-crypt-0.6.0.tar.gz && \
      cd git-crypt-0.6.0 && \
      make && \
      make install 

RUN set -x && \
    VER="17.09.0-ce" && \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
    tar -xzf /tmp/docker-$VER.tgz -C /tmp && \
    mv /tmp/docker/* /usr/bin

ENTRYPOINT []
