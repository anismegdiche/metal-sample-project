#!/bin/bash

check_logs() {
    docker compose logs "$1" | grep -q "$2"
}

#
#   MS SQL Server
#
mkdir -p ms-hr
chmod 777 ms-hr
chmod +x ./sample/ms-hr/import.sh

docker compose up -d ms-hr
while ! check_logs "ms-hr" "Recovery is complete" ; do
    echo "Waiting..."
    sleep 5
done
sleep 5
docker compose exec ms-hr /ms-hr-samples/import.sh
