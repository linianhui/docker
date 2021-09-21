FROM ghcr.io/linianhui/alpine:3.14

# http://www.dest-unreach.org/socat/
RUN apk add --no-cache socat

CMD ["TCP-LISTEN:2375,fork,reuseaddr","UNIX-CONNECT:/var/run/docker.sock"]

ENTRYPOINT ["socat"]

EXPOSE 2375
