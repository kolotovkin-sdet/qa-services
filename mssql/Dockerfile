ARG MSSQL_VERSION
FROM mcr.microsoft.com/mssql/server:${MSSQL_VERSION}

USER root

WORKDIR /opt/mssql-tools/bin

ENV ACCEPT_EULA=Y \
    MSSQL_SA_PASSWORD=paSsWord1 \
    MSSQL_PID=Developer

COPY mssql/entrypoint-initdb.sh /entrypoint-initdb.sh
RUN chmod +x /entrypoint-initdb.sh

USER mssql

EXPOSE 1433

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
    CMD /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" || exit 1

ENTRYPOINT ["/entrypoint-initdb.sh"]