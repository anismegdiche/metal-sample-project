#!/bin/bash

#
#   Mongodb
#

chmod +x ./sample/mongodb/sample_mflix/import.sh
docker-compose up -d mongodb
sleep 20
docker-compose exec mongodb /mongodb-samples/import.sh
docker-compose down

#
#   MS SQL Server
#
mkdir -p mssql
chmod 777 mssql
chmod +x ./sample/mssql/import.sh

docker-compose up -d mssql
sleep 30
docker-compose exec mssql /mssql-samples/import.sh
docker-compose down

#
#   Postgres 1
#
mkdir -p postgres1
chown 999:0 postgres1
chmod +x ./sample/postgres1/import.sh

docker-compose up -d postgres1
sleep 20
docker-compose exec postgres1 /postgres1-samples/import.sh
docker-compose down

#
#   Postgres 2
#
mkdir -p postgres2
chown 999:0 postgres2
chmod +x ./sample/postgres2/import.sh

docker-compose up -d postgres2
sleep 20
docker-compose exec postgres2 /postgres2-samples/import.sh
docker-compose down
