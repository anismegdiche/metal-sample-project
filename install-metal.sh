#!/bin/bash

check_logs() {
    docker compose logs "$1" | grep -q "$2"
}

#
#   Metal Server
#
git clone   https://github.com/anismegdiche/metal-server.git    metal-server-config
mkdir -p    metal-server
\cp -rp     metal-server-config/config metal-server
mv          metal-server-config/__rest__                        .
\cp -rp     metal-server/config/config-sample-docker.yml        metal-server/config/config.yml
rm -rf      metal-server-config
#
docker compose build --no-cache metal
