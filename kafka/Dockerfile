ARG CONFLUENTIC_VERSION
FROM confluentinc/cp-kafka:${CONFLUENTIC_VERSION}
# todo доделать в другом МРе
ENV KAFKA_NODE_ID=1 \
    CLUSTER_ID=MkU3OEVBNTcwNTJENDM2Qk \
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,LOCAL:PLAINTEXT,CONTROLLER:PLAINTEXT \
    KAFKA_LISTENERS=PLAINTEXT://kafka-test:9092,LOCAL://kafka-test:9091,CONTROLLER://kafka-test:9093 \
    KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka-test:9092,LOCAL://localhost:9091 \
    KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    KAFKA_PROCESS_ROLES=broker,controller \
    KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1 \
    KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1 \
    KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0 \
    KAFKA_JMX_PORT=9101 \
    KAFKA_JMX_HOSTNAME=localhost \
    KAFKA_CONTROLLER_QUORUM_VOTERS="1@kafka-test:9093" \
    KAFKA_CONTROLLER_LISTENER_NAMES=CONTROLLER

EXPOSE 9091 9092 9093 9101

HEALTHCHECK --interval=3s --timeout=5s --retries=300 \
    CMD bash -c "echo 'describe cluster' | kafka-broker-api-versions --bootstrap-server kafka-test:9092"