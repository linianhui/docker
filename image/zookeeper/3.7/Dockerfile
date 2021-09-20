FROM zookeeper:3.7

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install curl wget unzip tcpdump net-tools iproute2 vim jq coreutils\
    && apt-get -y autoremove \
    && apt-get -y clean

# client port
EXPOSE 2181

# internal : leader port
EXPOSE 2888

# internal : peer port
EXPOSE 3888

# admin web ui port
EXPOSE 8080
