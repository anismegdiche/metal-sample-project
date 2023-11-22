#!/bin/bash
psql -U admin -d postgres -a -f /pg-clubdata-bookings-samples/data.sql
