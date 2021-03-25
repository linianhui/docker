# https://github.com/containous/traefik
# https://hub.docker.com/_/traefik/
FROM traefik:v2.1

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/traefik/v2.1"

COPY . /app

WORKDIR /app

EXPOSE 80 8080
