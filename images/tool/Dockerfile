# https://hub.docker.com/_/alpine
FROM alpine:3.9

LABEL author="lnhcode@outlook.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache \
    tcpdump \
    net-tools \
    iproute2 \
    curl \
    wget \
    vim \
    git

ENTRYPOINT [ "tail","-f","/dev/null" ]