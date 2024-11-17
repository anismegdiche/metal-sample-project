#!/bin/bash

check_logs() {
    docker compose logs "$1" | grep -q "$2"
}

#
#   Postgres (clubdata)
#
mkdir -p pg-clubdata
chown 999:0 pg-clubdata
chmod +x ./sample/pg-clubdata/import.sh

docker compose up -d pg-clubdata
while ! check_logs "pg-clubdata" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker compose exec pg-clubdata /pg-clubdata-samples/import.sh
