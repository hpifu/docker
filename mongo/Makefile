version=v1.0.0
repository=mongo
user=hatlonely

.PHONY: deploy remove build push

deploy:
	mkdir -p ${HOME}/var/docker/${repository}/log
	mkdir -p ${HOME}/var/docker/${repository}/data
	docker stack deploy -c ${repository}.yml ${repository}

remove:
	docker stack rm ${repository} 

build:
	docker build --tag=${user}/${repository}:${version} .
	sed -i "" 's/image: ${user}\/${repository}:.*$$/image: ${user}\/${repository}:${version}/g' ${repository}.yml

push:
	docker push ${user}/${repository}:${version}

