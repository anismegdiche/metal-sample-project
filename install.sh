#!/bin/bash

check_logs() {
    docker-compose logs $1 | grep -q "$2"
}

#
#   Metal Server
#
docker-compose build metal

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

#
#   MS SQL Server
#
mkdir -p ms-hr
chmod 777 ms-hr
chmod +x ./sample/ms-hr/import.sh

docker-compose up -d ms-hr
while ! check_logs "ms-hr" "Recovery is complete" ; do
    echo "Waiting..."
    sleep 5
done
sleep 5
docker-compose exec ms-hr /ms-hr-samples/import.sh

#
#   Postgres (northwind)
#
mkdir -p pg-northwind
chown 999:0 pg-northwind
chmod +x ./sample/pg-northwind/import.sh

docker-compose up -d pg-northwind
while ! check_logs "pg-northwind" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec pg-northwind /pg-northwind-samples/import.sh

#
#   Postgres (clubdata)
#
mkdir -p pg-clubdata
chown 999:0 pg-clubdata
chmod +x ./sample/pg-clubdata/import.sh

docker-compose up -d pg-clubdata
while ! check_logs "pg-clubdata" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec pg-clubdata /pg-clubdata-samples/import.sh

# Start the stack
docker-compose up -d