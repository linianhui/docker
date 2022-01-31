# https://hub.docker.com/_/mysql/
FROM mysql:8.0

# https://dev.mysql.com/doc/refman/5.7/en/environment-variables.html
# ENV MYSQL_ALLOW_EMPTY_PASSWORD=no \
#     MYSQL_ROOT_PASSWORD=1234 \
#     MYSQL_DATABASE=test

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils tini\
    && apt-get -y autoremove \
    && apt-get -y clean

EXPOSE 3306
