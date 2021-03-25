# https://hub.docker.com/r/lnhcode/alpine
FROM lnhcode/alpine:3.11

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/docker-api/latest"

# http://www.dest-unreach.org/socat/
RUN apk add --no-cache socat

CMD ["TCP-LISTEN:2375,fork,reuseaddr","UNIX-CONNECT:/var/run/docker.sock"]

EXPOSE 2375

ENTRYPOINT ["socat"]
