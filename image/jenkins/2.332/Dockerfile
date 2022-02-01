# https://hub.docker.com/r/jenkins/jenkins/
# https://github.com/jenkinsci/docker/blob/master/README.md
FROM jenkins/jenkins:2.332

USER root

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils tini\
    && apt-get -y autoremove \
    && apt-get -y clean

EXPOSE 8080 50000
