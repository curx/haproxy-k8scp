#!/bin/sh
set -e

# set defaults
KUBEAPI_VIP_PORT="${KUBEAPI_VIP_PORT:-6443}"
KUBEAPI_VIP_STATS_PORT="${KUBEAPI_VIP_STATS_PORT:-9000}"
HAPROXY_CONF="/usr/local/etc/haproxy/haproxy.cfg"
HAPROXY_CONF_TPL="${HAPROXY_CONF}.tpl"
HAPROXY_CONF_CHK_OPTS="${HAPROXY_CONF_CHK_OPTS:-GET /healthz}"

# checks
if [ "x$KUBEAPI_VIP" == "x" ]; then
  echo "Error, no environment KUBEAPI_VIP set, abort"
  exit 1;
fi

if [ "x$HAPROXY_BACKENDS" == "x" ]; then
  echo "Error, no environment HAPROXY_BACKENDS set, abort"
  exit 1;
fi

# create config from template
sed \
  -e "s#KUBEAPI_VIP_PORT#$KUBEAPI_VIP_PORT#g" \
  -e "s#KUBEAPI_VIP_STATS_PORT#$KUBEAPI_VIP_STATS_PORT#g" \
  -e "s#KUBEAPI_VIP#$KUBEAPI_VIP#g" \
  -e "s#HAPROXY_CONF_CHK_OPTS#$HAPROXY_CONF_CHK_OPTS#g" \
  $HAPROXY_CONF_TPL > $HAPROXY_CONF

echo $HAPROXY_BACKENDS | sed 's#,#\n#g' | while IFS= read -r backend
do
  no=$(($no+1))
  if [ "x$(echo $backend | cut -d ':' -f 2 -s)" == "x" ]; then
    BACKEND_PORT=":6443"
  fi
  echo "  server cp-$no $backend$BACKEND_PORT check check-ssl verify none" \
    >> $HAPROXY_CONF
done

exec haproxy -W -db -f $HAPROXY_CONF
