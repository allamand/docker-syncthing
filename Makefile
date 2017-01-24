

build:
	docker build -t sebmoule/syncthing \
	--build-arg MYGID=1000 --build-arg MYUID=1000 \
	.

rm:
	docker stop syncthing | docker rm syncthing || true

run:rm
	docker run -d --restart=always \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/syncthing:/srv/config \
	-v ${HOME}/test-sync:/srv/test-sync \
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=1000 -e GID=1000 \
	--name syncthing \
	sebmoule/syncthing

run-bash:
	docker run --rm -ti \
	-v ${HOME}/sync:/srv/data \
	-v ${HOME}/syncthing:/srv/config \
	-v ${HOME}/test-sync:/srv/test-sync \
	-p 22000:22000  -p 21025:21025/udp -p 8080:8080 \
	-e UID=1000 -e GID=1000 \
	sebmoule/syncthing


#	joeybaker/syncthing
