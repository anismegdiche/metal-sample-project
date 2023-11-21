#!/bin/bash
psql -U admin -d postgres -a -f /pg-clubdata-samples/data.sql
