FROM google/cloud-sdk:alpine

RUN gcloud components install kubectl docker-credential-gcr

RUN apk add --no-cache \ 
  tar \
  sudo \
  jq \
  gnupg \
  make \
  expect \
  g++ \
  openssh \
  openssl \
  openssl-dev 

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

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint

ENV KUBE_PATH /bin/user-repo

# LABEL com.circleci.preserve-entrypoint=true

ENTRYPOINT ["/entrypoint"]
