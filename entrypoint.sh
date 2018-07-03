#!/bin/bash
set -e

while test $# -gt 0; do
  case "$1" in
    -o*|--oauth*)
      shift
      export KUBE_OAUTH=$1
      shift
      ;;
     -r*|--repo*)
      shift
      export KUBE_REPO=$1
      shift
      ;;
    *)
      break
      ;;
  esac
done

# Clone using passed in KUBE_OAUTH token
git clone --depth 1 -b develop https://$KUBE_OAUTH:x-oauth-basic@github.com/$KUBE_REPO.git $KUBE_PATH 

# Decrypt
$KUBE_PATH/ci-decrypt

# Link for easy usage
ln -s $KUBE_PATH/build/docker /usr/local/bin/build-docker
ln -s $KUBE_PATH/build/circle-app-env /usr/local/bin/build-circle-app-env
ln -s $KUBE_PATH/deploy/upload-docker-image /usr/local/bin/deploy-upload-docker-image
ln -s $KUBE_PATH/deploy/kube /usr/local/bin/deploy-kube
ln -s $KUBE_PATH/deploy/deploy-docker /usr/local/bin/deploy-docker
ln -s $KUBE_PATH/deploy/deploy-to-kube /usr/local/bin/deploy-to-kube
ln -s $KUBE_PATH/deploy/get-deploy-yaml /usr/local/bin/get-deploy-yaml
