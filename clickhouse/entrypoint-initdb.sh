#!/bin/bash

for sql_file in /migrations/*.sql; do
  echo "Executing migrations script $sql_file..."
   clickhouse-client --host localhost --user default --multiquery "$sql_file"
  if [ $? -ne 0 ]; then
    echo "Error executing $sql_file"
    exit 1
  fi
done

echo "Initialization complete"