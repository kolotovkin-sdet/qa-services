ARG REDIS_VERSION
FROM bitnami/redis:${REDIS_VERSION}

USER root

RUN apt-get update && \
    apt-get install -y supervisor gettext --no-install-recommends  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    adduser \
        --disabled-password \
        --gecos "" \
        --home "/nonexistent" \
        --shell "/sbin/nologin" \
        --no-create-home \
        --uid 1001 redis && \
    chown -R 1001:1001 /opt/bitnami/redis/etc

ENV REDIS_REPLICATION_MODE=master \
    ALLOW_EMPTY_PASSWORD=yes \
    REDIS_SENTINEL_RESOLVE_HOSTNAMES=yes \
    REDIS_MASTER_SET=mymaster \
    REDIS_SENTINEL_QUORUM=1 \
    REDIS_MASTER_HOST=127.0.0.1

COPY --chown=redis:redis redis/supervisord.conf /etc/supervisor/supervisord.conf
COPY --chown=redis:redis redis/config/* /opt/bitnami/redis/etc
COPY --chown=redis:redis redis/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER redis

EXPOSE 6379 26379

HEALTHCHECK --interval=5s --timeout=1s --retries=3 \
    CMD redis-cli ping | grep -q PONG || exit 1

ENTRYPOINT ["/entrypoint.sh"]