version=1.0.0
repository=smtp
user=hatlonely

.PHONY: deploy remove build push

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	sedi=sed -i ""
else
	sedi=sed -i
endif

deploy:
	mkdir -p ${HOME}/var/docker/${repository}/data
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

build:
	docker build --tag=${user}/${repository}:${version} .
	$(sedi) 's/image: ${user}\/${repository}:.*$$/image: ${user}\/${repository}:${version}/g' stack.yml

push:
	docker push ${user}/${repository}:${version}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
