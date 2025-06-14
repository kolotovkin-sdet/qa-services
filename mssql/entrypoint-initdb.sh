#!/bin/bash
set -e

/opt/mssql/bin/sqlservr &

sleep 15

for sql_file in /migrations/*.sql; do
  echo "Executing migrations script $sql_file..."
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${MSSQL_SA_PASSWORD}" -d master -i "$sql_file"
  if [ $? -ne 0 ]; then
    echo "Error executing $sql_file"
    exit 1
  fi
done

echo "Initialization complete"

while true; do sleep 1; done
