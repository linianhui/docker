# https://hub.docker.com/r/lnhcode/alpine
FROM lnhcode/alpine:3.10

# https://docs.docker.com/engine/reference/builder/#label
LABEL maintainer="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/docker-api/2375"

# http://www.dest-unreach.org/socat/
RUN apk add --no-cache socat

CMD ["TCP-LISTEN:2375,fork,reuseaddr","UNIX-CONNECT:/var/run/docker.sock"]

EXPOSE 2375

ENTRYPOINT ["socat"]
