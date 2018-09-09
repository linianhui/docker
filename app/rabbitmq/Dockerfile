# https://hub.docker.com/_/rabbitmq/
# https://github.com/docker-library/rabbitmq/blob/master/3.7/alpine/Dockerfile
FROM rabbitmq:3.7-management-alpine

ENV RABBITMQ_DEFAULT_VHOST=default_vhost

# 4369 epmd
# 5671 AMQP 0-9-1 with TLS
# 5672 AMQP 0-9-1 without TLS
# 15672 management plugin(default username and password : guest)
# 25672 Erlang distribution
EXPOSE  5672  15672