#!/bin/bash

check_logs() {
    docker-compose logs "$1" | grep -q "$2"
}

#
#   Metal Server
#
git clone   https://github.com/anismegdiche/metal-server.git    metal-server-config
mkdir -p    metal-server
\cp -rp     metal-server-config/config metal-server
mv          metal-server-config/__rest__                        .
\cp -rp     metal-server/config/config-sample-docker.yml        metal-server/config/config.yml
rm -rf      metal-server-config
#
docker-compose build metal

./install-azurite.sh

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

###
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

#
#   Postgres (clubdata), table facilities
#
mkdir -p pg-clubdata-facilities
chown 999:0 pg-clubdata-facilities
chmod +x ./sample/pg-clubdata-facilities/import.sh

docker-compose up -d pg-clubdata-facilities
while ! check_logs "pg-clubdata-facilities" "database system is ready to accept connections" ; do
    echo "Waiting..."
    sleep 5
done
docker-compose exec pg-clubdata-facilities /pg-clubdata-facilities-samples/import.sh

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

# Start the stack
docker-compose up -d