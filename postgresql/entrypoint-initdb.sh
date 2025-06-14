#!/bin/bash

docker_my_server_start() {
    if [ "$1" = 'postgres' ]; then
        shift
    fi

    set -- "$@" -c listen_addresses='*' -p "${PGPORT:-5432}"

    NOTIFY_SOCKET= \
    PGUSER="${PGUSER:-$POSTGRES_USER}" \
    pg_ctl -D "$PGDATA" \
        -o "$(printf '%q ' "$@")" \
        -w start
}

echo "Stopping postgres server to change config for migrations"
docker_temp_server_stop
echo "Stopped"

echo "Starting postgres server with new config"
docker_my_server_start
echo "Started"

echo "Applying migrations"
goose -v -allow-missing -dir /migrations postgres postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:${PGPORT}/${POSTGRES_DB}?sslmode=disable up
echo "Migrations applied!"

