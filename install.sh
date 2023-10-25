#!/bin/bash
#
#   Prepare
#
DOCKER_CMD="docker-compose"

#
#   Mongodb
#

chmod +x ./sample/mongodb/sample_mflix/import.sh
$DOCKER_CMD up -d mongodb
sleep 20
$DOCKER_CMD exec mongodb /mongodb-samples/import.sh
$DOCKER_CMD down

#
#   MS SQL Server
#
mkdir -p mssql
chmod 777 mssql
chmod +x ./sample/mssql/import.sh

$DOCKER_CMD up -d mssql
sleep 20
$DOCKER_CMD exec mssql /mssql-samples/import.sh
$DOCKER_CMD down

#
#   Postgres 1
#
mkdir -p postgres1
chown 999:0 postgres1
chmod +x ./sample/postgres1/import.sh

$DOCKER_CMD up -d postgres1
sleep 20
$DOCKER_CMD exec postgres1 /postgres1-samples/import.sh
$DOCKER_CMD down

#
#   Postgres 2
#
mkdir -p postgres2
chown 999:0 postgres2
chmod +x ./sample/postgres2/import.sh

$DOCKER_CMD up -d postgres2
sleep 20
$DOCKER_CMD exec postgres2 /postgres2-samples/import.sh
$DOCKER_CMD down
