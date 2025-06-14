ARG WIREMOCK_VERSION
FROM holomekc/wiremock-gui:${WIREMOCK_VERSION}

RUN mkdir -p /home/wiremock/storage

ENV GRPC_JSON_PRINTER_INCLUDE_ALL_DEFAULT_VALUE_FIELDS=true

EXPOSE 52250

CMD [ "--port=52250", "--local-response-templating", "--verbose", "--root-dir=/home/wiremock/storage", "--permitted-system-keys=.*" ]

COPY ["wiremock-grpc/wiremock-grpc-extension-standalone-0.9.0.jar", "/var/wiremock/extensions/"]

HEALTHCHECK --interval=10s --timeout=1s --retries=30 \
    CMD curl -s -o /dev/null -w "%{http_code}" http://localhost:52250/__admin/settings | grep -q 200
