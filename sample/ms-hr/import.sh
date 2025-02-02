#!/bin/bash

# Check if sqlcmd is available
if command -v /opt/mssql-tools/bin/sqlcmd &>/dev/null; then
  SQLCMD="/opt/mssql-tools/bin/sqlcmd"
elif command -v /opt/mssql-tools18/bin/sqlcmd &>/dev/null; then
  SQLCMD="/opt/mssql-tools18/bin/sqlcmd"
else
  echo "Error: sqlcmd not found!" >&2
  exit 1
fi

# Run sqlcmd with SSL trust flag (-C)
"$SQLCMD" -S localhost -U SA -P "$SA_PASSWORD" -i /ms-hr-samples/data.sql -C
