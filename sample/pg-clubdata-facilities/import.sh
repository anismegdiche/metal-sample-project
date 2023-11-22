#!/bin/bash
psql -U admin -d postgres -a -f /pg-clubdata-facilities-samples/data.sql
