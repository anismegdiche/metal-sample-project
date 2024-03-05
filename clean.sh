#!/bin/bash
docker-compose down
rm -rf \
    __rest__ \
    metal-server* \
    ms-hr \
    mdb-mflix \
    pg-northwind \
    pg-clubdata* \
    azurite_*
