# https://www.docker.elastic.co
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.4.2

COPY ./config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

ENV ES_JAVA_OPTS="-Xmx256m -Xms256m"

EXPOSE 9200 9300
