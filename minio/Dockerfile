ARG MINIO_VERSION
FROM minio/minio:${MINIO_VERSION}

ENV MINIO_ROOT_USER=minioadmin \
    MINIO_ROOT_PASSWORD=minioadmin

EXPOSE 9000 9001

CMD ["server", "--console-address", ":9001", "/data"]