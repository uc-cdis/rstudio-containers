# TL;DR

A simple reverse proxy config that proxies a port at http://localhost:$PORT/$PREFIX to http://localhost:7780/lw-workspace/proxy/ where `PORT` and `PREFIX` are passed in as enviornment variables.

See the [hatchery documentation](https://github.com/uc-cdis/hatchery/blob/master/doc/explanation/dockstore.md) for details on hatchery's support for docker-compose application specification.

## Example

This [sample docker-compose file](./nginx-proxy.yml)
