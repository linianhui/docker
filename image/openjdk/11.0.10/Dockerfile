# https://hub.docker.com/_/openjdk
FROM openjdk:11.0.10

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/openjdk/11.0.10"

COPY sources.list /etc/apt/sources.list

ENV JAVA_DEBUG_OPTIONS='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'
