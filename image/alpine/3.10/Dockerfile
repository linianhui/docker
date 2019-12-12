# https://hub.docker.com/_/alpine
FROM alpine:3.10

# https://docs.docker.com/engine/reference/builder/#label
LABEL MAINTAINER="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/alpine/3.10"

# https://developer.aliyun.com/mirror/alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
