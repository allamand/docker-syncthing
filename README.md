# docker-syncthing [![Docker Pulls](https://img.shields.io/docker/pulls/sebmoule/syncthing.svg)](https://registry.hub.docker.com/u/sebmoule/syncthing/)

Run [syncthing](https://syncthing.net) from a docker container

## Install
```sh
docker pull sebmoule/syncthing
```

## Usage

You need to bind-mount every folder you want to synchronize within syncthing.
In this case I want to synchronize /home/sync, /home/work, /home/tools, /home/go directories

Once they exists inside the syncthing container we can configure them in the UI to be synchronized.
You need to launch the syncthing container on everyhost you wants to synchronize.

Example usage :
```sh
docker run -d --restart=always \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/work:/srv/work \
	-v ${HOME}/tools:/srv/tools \
	-v ${HOME}/go:/srv/go \	
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=$(shell id -u) -e GID=$(shell id -g) \
	--name syncthing \
	sebmoule/syncthing
```

We give your linux user UID and GID to the container so that it can adapt the user right inside the container to those you really have.

> Syncthing will create a file `.stfolder` in each directory it synchronized. You need to keep this special file untouched.

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

original work taken from @joeybaker - joeybaker/syncthing
