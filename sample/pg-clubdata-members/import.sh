#!/bin/bash
psql -U admin -d postgres -a -f /pg-clubdata-members-samples/data.sql
