# https://hub.docker.com/_/openjdk
FROM openjdk:11.0.10

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils\
    && apt-get -y autoremove \
    && apt-get -y clean

ENV JAVA_DEBUG_OPTIONS='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:5005'

RUN echo 'alias ja="java -jar /arthas/arthas-boot.jar"' >> ~/.bashrc

ADD https://arthas.aliyun.com/arthas-boot.jar /arthas/
