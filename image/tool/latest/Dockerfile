# https://hub.docker.com/r/lnhcode/alpine
FROM lnhcode/alpine:3.10

# https://docs.docker.com/engine/reference/builder/#label
LABEL maintainer="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/tool/latest"

RUN apk --update --no-cache add \
    tcpdump \
    net-tools \
    iproute2 \
    curl \
    wget \
    vim \
    git \
    nghttp2 \
    jq
