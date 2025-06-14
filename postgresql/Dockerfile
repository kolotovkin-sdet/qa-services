ARG POSTGRESQL_VERSION
FROM postgres:${POSTGRESQL_VERSION}

ARG GOOSE_VERSION=v3.15.0

RUN echo "GOOSE_VERSION is set to ${GOOSE_VERSION}" && \
    apk add --no-cache curl && \
    curl -L -o /tmp/goose https://github.com/pressly/goose/releases/download/${GOOSE_VERSION}/goose_linux_x86_64 && \
    chmod +x /tmp/goose && \
    mv /tmp/goose /bin/goose && \
    rm -rf /var/cache/apk/*

WORKDIR /migrations

COPY postgresql/entrypoint-initdb.sh /docker-entrypoint-initdb.d

ENV PGPORT=5432 \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres

EXPOSE ${PGPORT}

HEALTHCHECK --interval=3s --timeout=2s --retries=30 \
    CMD sh -c "pg_isready -d ${POSTGRES_DB} --username=${POSTGRES_USER} | grep -q 'accepting connections' || exit 1"