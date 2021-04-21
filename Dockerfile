FROM alpine:latest

RUN apk update && apk add \
    dhcp \
    && rm -rf /var/cache/apk/*

EXPOSE 67/udp 67/tcp