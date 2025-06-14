ARG SAPHANA_VERSION
FROM saplabs/hanaexpress:${SAPHANA_VERSION}

USER root

ENV HANA_SID=H00 \
    HANA_INSTANCE_NUMBER=00 \
    HANA_PASSWORD=HXEHana1

COPY saphana/999_init /hana/hooks/post_start/999_init

RUN chmod +x /hana/hooks/post_start/999_init

USER hxeadm

HEALTHCHECK --interval=30s --timeout=10s --retries=500 \
    CMD /usr/sap/HXE/HDB90/exe/hdbsql -i 90 -d HXE -u SYSTEM -p ${HANA_PASSWORD} "SELECT CURRENT_UTCTIMESTAMP FROM DUMMY" || exit 1

CMD ["--master-password", "HXEHana1", "--agree-to-sap-license"]