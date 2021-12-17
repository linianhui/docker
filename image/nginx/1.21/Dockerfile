# https://hub.docker.com/_/nginx

FROM nginx:1.21

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils\
    && apt-get -y autoremove \
    && apt-get -y clean
