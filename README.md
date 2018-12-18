# haproxy for a high-available kubernetes controlplane

This Docker Images is used for StaticPod on an Kubernetes Controlplane.

## Available environment variables

```
# Configure the Kubernetes VirtualIP[:Port]
# - mandatory
KUBEAPI_VIP_PORT

# Configure the Port for the HAProxy Stats Interface
KUBEAPI_VIP_STATS_PORT 

# configure the BackendServers (List)
# - mandatory
HAPROXY_BACKENDS
```

## Example

```bash
docker run \
  -e KUBEAPI_VIP_PORT="192.168.1.1" \
  -e KUBEAPI_VIP_STATS_PORT="19001" \
  -e HAPROXY_BACKENDS ="192.168.1.11,192.168.1.12:6443,a.b.c.d:1234" \
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
