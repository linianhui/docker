# https://hub.docker.com/r/lnhcode/alpine
FROM ghcr.io/linianhui:3.14

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
