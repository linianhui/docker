FROM alpine:3.8

RUN apk add socat --no-cache

CMD ["TCP-LISTEN:2375,fork,reuseaddr","UNIX-CONNECT:/var/run/docker.sock"]

EXPOSE 2375

ENTRYPOINT ["socat"]