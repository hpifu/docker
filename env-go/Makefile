version=$(shell git describe --tags)
repository=go-env
user=hatlonely

.PHONY: build push

build:
	docker build --tag=${user}/${repository}:${version} .

push:
	docker push ${user}/${repository}:${version}
