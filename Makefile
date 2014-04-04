build:
	docker build --tag=deis/pypi-mirror .

run:
	docker run \
		--publish=:80:80 \
		-v /srv/pypi:/srv/pypi:rw \
		deis/pypi-mirror

test:
	echo "No tests." && exit 1

shell:
	docker run \
		--interactive \
		--tty \
		--publish=:80:80 \
		-v /srv/pypi:/srv/pypi:rw \
		deis/pypi-mirror /bin/bash

clean:
	-docker rmi deis/pypi-mirror

nuke_from_orbit:
	-docker kill `docker ps -q`
	-docker rm `docker ps -a -q`
	-docker rmi `docker images -q`
