ARG CONFLUENTIC_VERSION
FROM confluentinc/cp-schema-registry:${CONFLUENTIC_VERSION}

ENV SCHEMA_REGISTRY_HOST_NAME=schema-registry \
    SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS=PLAINTEXT://kafka-test:9092

HEALTHCHECK --interval=3s --timeout=5s --retries=300 \
    CMD curl --output /dev/null --silent --head --fail http://localhost:8081/subjects || exit 1

EXPOSE 8081