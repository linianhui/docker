# https://hub.docker.com/_/mysql/
# https://github.com/docker-library/mysql/blob/master/5.7/Dockerfile
FROM mysql:5

# https://dev.mysql.com/doc/refman/5.7/en/environment-variables.html
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no \
    MYSQL_ROOT_PASSWORD=1234 \
    MYSQL_DATABASE=zipkin \
    MYSQL_USER=zipkin \
    MYSQL_PASSWORD=zipkin 

EXPOSE 3306