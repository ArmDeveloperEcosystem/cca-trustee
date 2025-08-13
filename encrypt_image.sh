#!/usr/bin/env bash

# Copy a docker image from an external to a local repository and encrypt it.
# By default use docker://busybox image as a source.

. .env

IMAGE=${1:-busybox}

# Remove repository and tag if included
IMAGE_ENC=${IMAGE#*/}
IMAGE_ENC=${IMAGE_ENC%:*}
IMAGE_ENC="${IMAGE_ENC}_encrypted"

set -e

params="provider:attestation-agent:keypath=/opt/confidential-containers/kbs/repository/${ENCRYPT_KEY}::keyid=kbs:///${ENCRYPT_KEY}"

echo "Encrypting docker://${IMAGE} image with ${IMAGE_ENC} name"
docker compose exec keyprovider skopeo copy --insecure-policy --encryption-key $params \
              --override-arch=arm64 docker://${IMAGE} docker://registry:5000/${IMAGE_ENC}

echo
echo "Inspecting MIMEType of docker://registry:5000/${IMAGE_ENC} image"
docker compose exec keyprovider skopeo inspect docker://registry:5000/${IMAGE_ENC} |grep MIMEType
