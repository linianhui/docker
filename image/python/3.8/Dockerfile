# https://hub.docker.com/_/python
FROM python:3.8-buster

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils tini\
    && apt-get -y autoremove \
    && apt-get -y clean
