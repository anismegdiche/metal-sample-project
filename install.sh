#!/bin/bash

./install-metal.sh
./install-azurite.sh
./install-mdb-mflix.sh
./install-ms-hr.sh
./install-pg-northwind.sh
./install-pg-clubdata.sh
./install-pg-clubdata-bookings.sh
./install-pg-clubdata-facilities.sh
./install-pg-clubdata-members.sh

# Start the stack
docker compose up -d