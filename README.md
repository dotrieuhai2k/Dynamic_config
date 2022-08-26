# Dynamic_config

## Build docker container

### Build container consul
```
cd /dynamic/consul
docker build -t consul .
```
### Build container cosnul-template
```
cd /dynamic/consul-template
docker build -t consultemplate .
```
## Up Docker-compose
```
docker-compose up
```
