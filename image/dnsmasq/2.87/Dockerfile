# https://hub.docker.com/_/zookeeper/

FROM ghcr.io/linianhui/alpine:3.17

VOLUME [ "/config","/log" ]

COPY config /config

RUN apk --update --no-cache add dnsmasq=2.87-r0

ENTRYPOINT ["/bin/sh", "-c", "dnsmasq --no-daemon --conf-file=/config/dnsmasq.conf"]

# dns
EXPOSE 53

# dhcp
EXPOSE 67
EXPOSE 68

# tftp
EXPOSE 69
