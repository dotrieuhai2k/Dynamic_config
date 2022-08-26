# Dynamic_config

## Build docker container

- ### Build container consul
```
cd /dynamic/consul
docker build -t consul .
```
- ### Build container consul-template
```
cd /dynamic/consul-template
docker build -t consultemplate .
```
## Up Docker-compose
```
cd dynamic
docker-compose up
```
