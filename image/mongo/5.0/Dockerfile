# https://hub.docker.com/_/mongo/
FROM mongo:5.0

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils tini\
    && apt-get -y autoremove \
    && apt-get -y clean

# ENV MONGO_INITDB_ROOT_USERNAME=root \
#     MONGO_INITDB_ROOT_PASSWORD=1234 \
#     MONGO_INITDB_DATABASE=default

EXPOSE 27017
