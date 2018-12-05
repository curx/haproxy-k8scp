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
