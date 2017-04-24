# Netdata-Plus

An extended version of [titpetric/netdata](https://github.com/titpetric/netdata) that allows individual hosts to be configured separately (for creating registries).

Exposes `/netdata-config/netdata.conf` by volume so that a host can be configured. Set one host to be the main registry node, then configure the other hosts to reference the main node.

Primarily for use within Rancher - add [emcniece/rancher-catalog](https://github.com/emcniece/rancher-catalog) to your Rancher instance to make the catalog item available.

## Use

```sh
docker run -d --cap-add SYS_PTRACE \
           -v /proc:/host/proc:ro \
           -v /sys:/host/sys:ro \
           -v ./netdata-config:/netdata-config \
           -p 19999:19999 emcniece/netdata-plus
```

## Links

- [Dockerhub Repo](https://hub.docker.com/r/emcniece/netdata-plus/)