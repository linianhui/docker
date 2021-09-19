FROM ghcr.io/linianhui/openjdk:8u302

WORKDIR /hbase

ENV HBASE_VERSION=2.3.6
ENV HBASE_DOWNLOAD_URL=https://dlcdn.apache.org/hbase/2.3.6/hbase-2.3.6-bin.tar.gz

RUN wget -O /tmp/hbase.tar.gz $HBASE_DOWNLOAD_URL \
    && tar --strip 1 -xzf /tmp/hbase.tar.gz -C /hbase \
    && rm -f /tmp/hbase.tar.gz

#COPY conf/ /hbase/conf/
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

# 2821  zookeeper client port
EXPOSE 2821

# 16000 hbase master port
EXPOSE 16000

# 16010 hbase master web ui port
EXPOSE 16010

# 16020 hbase regionserver port
EXPOSE 16020

# 16030 hbase regionserver web ui port
EXPOSE 16030
