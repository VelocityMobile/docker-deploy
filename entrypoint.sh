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
git clone --depth 1 -b develop https://$KUBE_OAUTH:x-oauth-basic@github.com/$KUBE_REPO.git /bin/user-repo 

# Decrypt
/bin/user-repo/ci-decrypt

# Link for easy usage
ln -s /bin/user-repo/build/docker /usr/local/bin/build-docker
ln -s /bin/user-repo/build/circle-app-env /usr/local/bin/build-circle-app-env
ln -s /bin/user-repo/deploy/upload-docker-image /usr/local/bin/deploy-upload-docker-image
ln -s /bin/user-repo/deploy/kube /usr/local/bin/deploy-kube
ln -s /bin/user-repo/deploy/deploy-docker /usr/local/bin/deploy-docker
ln -s /bin/user-repo/switch-kube-environment /usr/local/bin/switch-kube-environment
ln -s /bin/user-repo/deploy/deploy-to-kube /usr/local/bin/deploy-to-kube
ln -s /bin/user-repo/deploy/get-deploy-yaml /usr/local/bin/get-deploy-yaml
