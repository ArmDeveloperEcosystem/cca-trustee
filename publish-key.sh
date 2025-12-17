#!/usr/bin/env bash

# Publish a key as a KBS resource to be used for docker images encryptions

. .env

KEY_FILE=${1:-image.key}

if [ ! -f ${KEY_FILE} ] || [ "$(wc -c ${KEY_FILE} |tr -d ' ')" != "32${KEY_FILE}" ]; then
    echo "${KEY_FILE} key should be a 32 byte key."
    echo "Please generate it:"
    echo "   head -c 32 /dev/urandom | openssl enc > ${KEY_FILE}"
    exit 1
fi

echo "Publishing ${KEY_FILE} as KBS resource ${ENCRYPT_KEY}"
docker compose run --rm -v "$PWD/${KEY_FILE}:/${KEY_FILE}" kbs-client \
    -c "kbs-client --url http://kbs:8080 config \\
          --auth-private-key /opt/confidential-containers/kbs/user-keys/private.key \\
          set-resource --path ${ENCRYPT_KEY} --resource-file /${KEY_FILE}"
