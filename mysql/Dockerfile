ARG MYSQL_VERSION
FROM mysql:${MYSQL_VERSION}

ARG GOOSE_VERSION=v3.15.0

RUN echo "GOOSE_VERSION is set to ${GOOSE_VERSION}" && \
    curl -L -o /tmp/goose https://github.com/pressly/goose/releases/download/${GOOSE_VERSION}/goose_linux_x86_64 && \
    chmod +x /tmp/goose && \
    mv /tmp/goose /bin/goose

ENV MYSQL_ROOT_PASSWORD=secret \
    MYSQL_USER=admin \
    MYSQL_PASSWORD=admin \
    MYSQL_DATABASE=testdb \
    LANG=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8

COPY mysql/entrypoint-initdb.sh /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld", \
    "--sql-mode=STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION", \
    "--character-set-server=utf8mb4", \
    "--collation-server=utf8mb4_unicode_ci"]

HEALTHCHECK --interval=3s --timeout=20s --retries=10 \
    CMD mysqladmin ping -h localhost || exit 1