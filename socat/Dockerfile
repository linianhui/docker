FROM alpine:3.8

RUN apk add socat --no-cache --repository http://mirrors.aliyun.com/alpine//v3.8/main/ --allow-untrusted 

CMD [TCP-LISTIEN:2375,fork,reuseaddr UNIX-CONNECT:/var/run/docker.sock]

ENTRYPOINT ["socat"]

EXPOSE 2375