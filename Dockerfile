FROM haproxy:1.9.5-alpine

CMD ["haproxy" "-f" "/usr/local/etc/haproxy/haproxy.cfg"]

RUN apk -U add socat

COPY scripts//docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY scripts/haproxy.cfg.tpl /usr/local/etc/haproxy

ENTRYPOINT ["docker-entrypoint.sh"]  
