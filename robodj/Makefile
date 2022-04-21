repository=api.wjrh.org:5000
name=robodj
host=10.49.1.1

update: build push up

secrets:
	@mkdir -p secrets
	@read -p "Icecast Password: " password; echo icecast_password="$$password" > secrets/passwords.liq

build: secrets
	sudo buildah build -f Containerfile --tag wjrh/$(name)

push:
	sudo buildah push --tls-verify=false wjrh/$(name) docker://$(repository)/$(name)

up: down
	ssh wjrh@$(host) sudo docker pull $(repository)/$(name)
	ssh wjrh@$(host) sudo docker run --rm --name $(name) --detach $(repository)/$(name)
	
down: 
	-ssh wjrh@$(host) sudo docker kill $(name)
	-ssh wjrh@$(host) sudo docker rm $(name)
