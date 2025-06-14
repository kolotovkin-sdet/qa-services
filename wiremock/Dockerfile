ARG WIREMOCK_VERSION
FROM holomekc/wiremock-gui:${WIREMOCK_VERSION}

RUN mkdir -p /home/wiremock/storage

CMD [ "--port=52250", "--local-response-templating", "--verbose", "--root-dir=/home/wiremock/storage", "--permitted-system-keys=.*" ]

EXPOSE 52250

HEALTHCHECK --interval=10s --timeout=1s --retries=30 \
    CMD curl -s -o /dev/null -w "%{http_code}" http://localhost:52250/__admin/settings | grep -q 200
