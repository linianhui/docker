# https://hub.docker.com/_/alpine

FROM alpine:3.9 AS builder

RUN apk add git build-base

RUN git clone https://github.com/sass/sassc
RUN git clone https://github.com/sass/libsass
ENV SASS_LIBSASS_PATH=/libsass

RUN make -C sassc -j4


FROM alpine:3.9

LABEL MAINTAINER="linhcode@outlook.com"
LABEL GITHUB_SASSC="https://github.com/sass/sassc"
LABEL GITHUB_LIBSASS="https://github.com/sass/libsass"

RUN apk add --no-cache libstdc++

COPY --from=builder /sassc/bin/sassc /usr/bin/sass

RUN sass -v

ENTRYPOINT ["sass"]