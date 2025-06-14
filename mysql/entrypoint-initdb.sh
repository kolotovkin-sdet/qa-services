#!/bin/bash
set -e

MIGRATIONS_DIR="/migrations"

echo "Checking for goose migrations in $MIGRATIONS_DIR..."

if [ -d "$MIGRATIONS_DIR" ] && [ -n "$(ls -A $MIGRATIONS_DIR/*.sql 2>/dev/null)" ]; then
    echo "Found goose migration files, applying..."
    goose -v -allow-missing -dir "$MIGRATIONS_DIR" mysql "${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(localhost:3306)/${MYSQL_DATABASE}?parseTime=true&timeout=5s" up
    echo "Migrations applied successfully!"
else
    echo "No goose migration files found in $MIGRATIONS_DIR, skipping..."
fi