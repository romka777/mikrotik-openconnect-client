FROM alpine

RUN set -xe && apk add --no-cache openconnect iptables iptables-legacy && echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf 
RUN wget https://gitlab.com/openconnect/vpnc-scripts/raw/master/vpnc-script -O /etc/vpnc/vpnc-script && chmod a+x /etc/vpnc/vpnc-script

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

