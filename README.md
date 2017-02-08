# docker-syncthing [![Docker Pulls](https://img.shields.io/docker/pulls/sebmoule/syncthing.svg)](https://registry.hub.docker.com/u/sebmoule/syncthing/)

Run [syncthing](https://syncthing.net) from a docker container

## Install
```sh
docker pull joeybaker/syncthing
```

## Usage

```sh
docker run -d --restart=always \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/syncthing:/srv/config \
	-v ${HOME}/test-sync:/srv/test-sync \
	-v ${HOME}/working:/srv/working \
	-v ${HOME}/tools:/srv/tools \
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=$(shell id -u) -e GID=$(shell id -g) \
	--name syncthing \
	sebmoule/syncthing
```

If you want to add a new folder, make sure you set the path to something in `/srv/data`.

We give your linux user UID and GID to the container so that it can adapt the user right inside the container to those you really have.

## Developing

Build a New Image from latest Syncthing Sources
```
make build
```

Launch an instance of syncthing (or `make run-bash` if you want to debug user-rights..)
```
make run
```


## Crédit

original work taken from @joeybaker
