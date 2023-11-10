#!/bin/bash
psql -U admin -d postgres -a -f /postgres2-samples/data.sql
