# https://hub.docker.com/r/library/registry/
# https://github.com/docker/distribution
FROM registry:2.7

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/registry/2.7"

# https://github.com/docker/distribution/blob/master/cmd/registry/config-example.yml
RUN sed -i 's/addr: :5000/addr: :80/g' /etc/docker/registry/config.yml

EXPOSE 80
