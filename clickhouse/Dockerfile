ARG CLICKHOUSE_VERSION
FROM clickhouse/clickhouse-server:${CLICKHOUSE_VERSION}

USER root

ENV CLICKHOUSE_ALWAYS_RUN_INITDB_SCRIPTS=true

COPY --chown=clickhouse:clickhouse clickhouse/config.xml /etc/clickhouse-server/config.d/
COPY --chown=clickhouse:clickhouse clickhouse/users.xml /etc/clickhouse-server/users.d/
COPY --chown=clickhouse:clickhouse clickhouse/entrypoint-initdb.sh /docker-entrypoint-initdb.d/

HEALTHCHECK --interval=5s --timeout=3s --retries=10 \
    CMD clickhouse-client --query 'SELECT 1' || exit 1

USER clickhouse

EXPOSE 8123 9000
