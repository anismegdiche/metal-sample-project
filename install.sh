#!/bin/bash

#
#   Metal Server
#
docker-compose build metal

#
#   mdb-mflix
#

chmod +x ./sample/mdb-mflix/sample_mflix/import.sh
docker-compose up -d mdb-mflix
sleep 20
docker-compose exec mdb-mflix /mdb-mflix-samples/import.sh

#
#   MS SQL Server
#
mkdir -p ms-hr
chmod 777 ms-hr
chmod +x ./sample/ms-hr/import.sh

docker-compose up -d ms-hr
sleep 30
docker-compose exec ms-hr /ms-hr-samples/import.sh

#
#   Postgres 1
#
mkdir -p pg-northwind
chown 999:0 pg-northwind
chmod +x ./sample/pg-northwind/import.sh

docker-compose up -d pg-northwind
sleep 20
docker-compose exec pg-northwind /pg-northwind-samples/import.sh

#
#   Postgres 2
#
mkdir -p pg-clubdata
chown 999:0 pg-clubdata
chmod +x ./sample/pg-clubdata/import.sh

docker-compose up -d pg-clubdata
sleep 20
docker-compose exec pg-clubdata /pg-clubdata-samples/import.sh

# Start the stack
docker-compose up -d