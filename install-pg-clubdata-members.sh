#!/bin/bash

check_logs() {
    docker-compose logs "$1" | grep -q "$2"
}

#
#   Postgres (clubdata), table members
#
mkdir -p pg-clubdata-members
chown 999:0 pg-clubdata-members
chmod +x ./sample/pg-clubdata-members/import.sh

docker-compose up -d pg-clubdata-members
while ! check_logs "pg-clubdata-members" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec pg-clubdata-members /pg-clubdata-members-samples/import.sh
