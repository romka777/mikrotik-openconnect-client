FROM alpine

RUN set -xe && apk add --no-cache openconnect iptables iptables-legacy && echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf 

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

