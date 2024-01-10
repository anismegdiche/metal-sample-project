#!/bin/bash
docker-compose down
rm -rf \
    metal-server* \
    ms-hr \
    mdb-mflix \
    pg-northwind \
    pg-clubdata*
