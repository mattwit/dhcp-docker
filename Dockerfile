FROM alpine:latest

RUN apk update && apk add \
    dhcp \
    && rm -rf /var/cache/apk/*

EXPOSE 67/udp 67/tcp

VOLUME ["/home/docker/om-dhcp/conf", "/etc/dhcp"] ["/home/docker/om-dhcp/leases", "/var/lib/dhcpd"]

CMD ["/dhcpd", "-d", "--no-pid"]
