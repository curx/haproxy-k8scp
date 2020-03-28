global
  log stdout format raw daemon
  stats socket /admin.sock mode 660 level admin
  stats timeout 30s

defaults
  log     global
  mode    tcp
  option  tcplog
  option  dontlognull
  timeout connect  5000
  timeout client  50000
  timeout server  50000

listen stats
  bind KUBEAPI_VIP:KUBEAPI_VIP_STATS_PORT
  mode http
  stats enable
  stats realm Haproxy\ Statistics
  stats uri /stats

frontend fe-kube-apiserver
  bind KUBEAPI_VIP:KUBEAPI_VIP_PORT
  default_backend be-kube-apiserver

backend be-kube-apiserver
  balance roundrobin
  option httpchk HAPROXY_CONF_CHK_OPTS
  http-check expect string ok
