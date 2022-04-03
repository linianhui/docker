# https://hub.docker.com/_/openjdk
FROM openjdk:8u282

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/openjdk/8u282"

COPY sources.list /etc/apt/sources.list

ENV JAVA_DEBUG_OPTIONS='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:5005'

RUN echo 'alias ja="java -jar /arthas/arthas-boot.jar"' >> ~/.bashrc

ADD https://arthas.aliyun.com/arthas-boot.jar /arthas/
