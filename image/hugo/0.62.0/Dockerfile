# https://hub.docker.com/_/alpine
FROM lnhcode/alpine:3.10

# https://docs.docker.com/engine/reference/builder/#label
LABEL MAINTAINER="lnhcode@outlook.com"
LABEL DOCKERFILE="https://github.com/linianhui/docker/tree/master/image/hugo/0.62.0"

# https://github.com/gohugoio/hugo/releases
ENV HUGO_VERSION=0.62.0

RUN apk --no-cache add git libc6-compat libstdc++ 

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    -O hugo.tar.gz \
    && tar -xvf hugo.tar.gz hugo -C /usr/local/bin/ \
    && rm hugo.tar.gz
