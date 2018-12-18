FROM haproxy:1.9-dev11-alpine
COPY scripts//docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY scripts/haproxy.cfg.tpl /usr/local/etc/haproxy
CMD ["haproxy" "-f" "/usr/local/etc/haproxy/haproxy.cfg"]
ENTRYPOINT ["docker-entrypoint.sh"]  
