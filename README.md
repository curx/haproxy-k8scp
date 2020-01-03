# haproxy for a high-available kubernetes controlplane (k8scp)

[![Build Status](https://cloud.drone.io/api/badges/curx/haproxy-k8scp/status.svg)](https://cloud.drone.io/curx/haproxy-k8scp)

This OCI container images is used for an StaticPod at a Kubernetes Controlplane.

## Available environment variables

```
# Configure the Kubernetes VirtualIP[:Port]
# - mandatory
#   if Port not set, Default to 6443
# 
KUBEAPI_VIP="192.168.1.10"
KUBEAPI_VIP_PORT="16443"

# Configure the Port for the HAProxy Stats Interface
# Statistic Interface is located at http://$KUBEAPI_VIP_PORT:$KUBEAPI_VIP_STATS_PORT/stats
# - optional, default is set to 9000
#
KUBEAPI_VIP_STATS_PORT="12345"

# configure the BackendServers (List)
# - mandatory
#
HAPROXY_BACKENDS="backendserver1,backendserver2:port2,..."
```

## Example

```bash
docker run \
  -e KUBEAPI_VIP="0.0.0.0" \
  -e KUBEAPI_VIP_PORT="6443" \
  -e KUBEAPI_VIP_STATS_PORT="19001" \
  -e HAPROXY_BACKENDS="192.168.1.11,192.168.1.12:6443,a.b.c.d:1234" \
  ...
```

## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thorsten Schifferdecker](https://github.com/curx)


## License

GPL-2


## Copyright

```
Copyright (c) 2018 Thorsten Schifferdecker
```
