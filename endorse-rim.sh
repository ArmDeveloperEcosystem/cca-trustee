#!/usr/bin/env sh

# This script uses a kbs-client container to endorse a reference value
# for a RIM (Realm initial measurement)

if [ -z "$1" ]; then
    echo "Use: $0 <cca-realm-initial-measurement>"
    exit 1
fi

docker compose run --rm kbs-client \
    -c "kbs-client --url http://kbs:8080 config \
    --auth-private-key /opt/confidential-containers/kbs/user-keys/private.key \
    set-sample-reference-value cca.realm.cca-realm-initial-measurement $1"
