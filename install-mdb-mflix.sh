#!/bin/bash

check_logs() {
    docker-compose logs "$1" | grep -q "$2"
}

#
#   mdb-mflix
#

chmod +x ./sample/mdb-mflix/sample_mflix/import.sh
docker-compose up -d mdb-mflix
while ! check_logs "mdb-mflix" "Index build: done building" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec mdb-mflix /mdb-mflix-samples/import.sh
