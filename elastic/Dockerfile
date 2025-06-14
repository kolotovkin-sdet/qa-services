ARG ELASTIC_VERSION
FROM elasticsearch:${ELASTIC_VERSION}

ENV discovery.type=single-node \
    xpack.security.enabled=false \
    ELASTIC_PASSWORD=secret \
    ES_JAVA_OPTS="-Xms512M -Xmx512M"

EXPOSE 9200 9300

HEALTHCHECK --interval=3s --timeout=2s --retries=300 \
    CMD curl --silent --fail -u elastic:${ELASTIC_PASSWORD} localhost:9200/_cluster/health || exit 1

USER elasticsearch
