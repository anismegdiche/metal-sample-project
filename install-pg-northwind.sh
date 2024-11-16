#!/bin/bash

check_logs() {
    docker compose logs "$1" | grep -q "$2"
}

#
#   Postgres (northwind)
#
mkdir -p pg-northwind
chown 999:0 pg-northwind
chmod +x ./sample/pg-northwind/import.sh

docker compose up -d pg-northwind
while ! check_logs "pg-northwind" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker compose exec pg-northwind /pg-northwind-samples/import.sh
