#!/bin/bash

check_logs() {
    docker compose logs "$1" | grep -q "$2"
}

#
#   Postgres (clubdata), table facilities
#
mkdir -p pg-clubdata-facilities
chown 999:0 pg-clubdata-facilities
chmod +x ./sample/pg-clubdata-facilities/import.sh

docker compose up -d pg-clubdata-facilities
while ! check_logs "pg-clubdata-facilities" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker compose exec pg-clubdata-facilities /pg-clubdata-facilities-samples/import.sh
