repository=api.wjrh.org:5000
name=broadcast-controller

host=10.49.1.1
host_user=wjrh

init-ssh:
	ssh-copy-id $(host_user)@$(host)

build-and-deploy: build push up


# -----
# BUILD
# -----
build: secrets
	sudo buildah build -f Containerfile --tag wjrh/$(name)

secrets:
	@mkdir -p secrets
	@read -p "Icecast Password: " password; echo icecast_password="$$password" > passwords.liq

push:
	sudo buildah push --tls-verify=false wjrh/$(name) docker://$(repository)/$(name)

images:
	sudo buildah images


# ------
# DEPLOY
# ------

up: down
	ssh wjrh@$(host) sudo docker pull $(repository)/$(name)
	ssh wjrh@$(host) sudo docker run --rm --name $(name) --detach $(repository)/$(name)
	
down: 
	-ssh wjrh@$(host) sudo docker kill $(name)
