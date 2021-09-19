FROM ghcr.io/linianhui/openjdk:8u302

ENV HBASE_VERSION=2.3.6

RUN cd /tmp \
    && wget https://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz \
    && mkdir -p /hbase \
    && tar --strip 1 -xzvf hbase-${HBASE_VERSION}-bin.tar.gz -C /hbase \
    && rm -f /tmp/hbase-${HBASE_VERSION}-bin.tar.gz
