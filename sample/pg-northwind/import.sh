#!/bin/bash
psql -U admin -d postgres -a -f /pg-northwind-samples/data.sql
