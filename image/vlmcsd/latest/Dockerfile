FROM alpine:latest as builder
WORKDIR /root
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd vlmcsd/ && \
    make

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /root/vlmcsd/bin/vlmcsd /app/vlmcsd
EXPOSE 1688/tcp
CMD [ "/app/vlmcsd", "-D", "-d" ]
