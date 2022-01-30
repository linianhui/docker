# https://hub.docker.com/_/redis/
FROM redis:6.2

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils tini\
    && apt-get -y autoremove \
    && apt-get -y clean

# http://download.redis.io/redis-stable/redis.conf

EXPOSE 6379
