ARG AT_JDK_VERSION
FROM openjdk:${AT_JDK_VERSION}

ENV JAVA_DEBUG_ENABLED=true

EXPOSE 8080 5005 5051 9090

ENTRYPOINT [ "java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-jar", "app.jar" ]
