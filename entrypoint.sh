#!/bin/bash
set -e

while test $# -gt 0; do
  case "$1" in
    -o*|--oauth*)
      shift
      export OAUTH=$1
      shift
      ;;
     -r*|--repo*)
      shift
      export REPO=$1
      shift
      ;;
    *)
      break
      ;;
  esac
done

# Clone using passed in OAUTH token
git clone --depth 1 -b develop https://$OAUTH:x-oauth-basic@github.com/$REPO.git /usr/lib/$REPO

# Decrypt
./$REPO/ci-decrypt

# Link for easy usage
ln -s /usr/lib/$REPO/build/docker /usr/local/bin/build-docker
ln -s /usr/lib/$REPO/build/circle-app-env /usr/local/bin/build-circle-app-env
ln -s /usr/lib/$REPO/deploy/upload-docker-image /usr/local/bin/deploy-upload-docker-image
ln -s /usr/lib/$REPO/deploy/kube /usr/local/bin/deploy-kube
