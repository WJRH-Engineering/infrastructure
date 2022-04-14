

repository=api.wjrh.org:5000
name=broadcast-controller

host=api.wjrh.org
host_user=wjrh

init-ssh:
	ssh-copy-id $(host_user)@$(host)

build-and-deploy: build push up

build:
	sudo buildah build -f Containerfile --tag wjrh/$(name)

push:
	sudo buildah push --tls-verify=false wjrh/$(name) docker://$(repository)/$(name)

images:
	sudo buildah images


up: down
	ssh $(host_user)@$(host) mkdir -p deploy
	ssh $(host_user)@$(host) mkdir -p deploy/$(name)
	scp docker-compose.yml $(host_user)@$(host):deploy/$(name)/docker-compose.yml
	ssh $(host_user)@$(host) "cd deploy/$(name) && docker-compose pull"
	ssh $(host_user)@$(host) "cd deploy/$(name) && docker-compose up -d && docker-compose logs"

down:
	ssh $(host_user)@$(host) "cd deploy/$(name) && docker-compose down && docker-compose logs"

status:
	ssh $(host_user)@$(host) "cd deploy/$(name) && docker-compose logs"



test:
	sudo podman run 
