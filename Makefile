

build:
	docker build -t sebmoule/syncthing \
	--build-arg MYGID=1000 --build-arg MYUID=1000 \
	.

rm:
	docker stop syncthing || true
	docker rm syncthing || true


logs:
	docker logs -f --tail=10 syncthing

run:rm
	docker run -d --restart=always \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/syncthing:/srv/config \
	-v ${HOME}/test-sync:/srv/test-sync \
	-v ${HOME}/working:/srv/working \
	-v ${HOME}/tools:/srv/tools \
	-v ${HOME}/go:/srv/go \
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=$(shell id -u) -e GID=$(shell id -g) \
	--name syncthing \
	sebmoule/syncthing

run-bash:
	docker run --rm -ti \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/syncthing:/srv/config \
	-v ${HOME}/test-sync:/srv/test-sync \
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=$(shell id -u) -e GID=$(shell id -g) \
	sebmoule/syncthing


