# https://hub.docker.com/r/lnhcode/alpine
FROM lnhcode/alpine:3.13

# https://docs.docker.com/engine/reference/builder/#label
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/main/image/tool/latest"

VOLUME [ "/data" ]

RUN apk --update --no-cache add \
    tcpdump \
    net-tools \
    iproute2 \
    curl \
    wget \
    vim \
    git \
    nghttp2 \
    jq \
    coreutils
