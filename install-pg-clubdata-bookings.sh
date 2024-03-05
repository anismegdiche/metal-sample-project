#!/bin/bash

check_logs() {
    docker-compose logs "$1" | grep -q "$2"
}

#
#   Postgres (clubdata), table bookings
#
mkdir -p pg-clubdata-bookings
chown 999:0 pg-clubdata-bookings
chmod +x ./sample/pg-clubdata-bookings/import.sh

docker-compose up -d pg-clubdata-bookings
while ! check_logs "pg-clubdata-bookings" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec pg-clubdata-bookings /pg-clubdata-bookings-samples/import.sh
