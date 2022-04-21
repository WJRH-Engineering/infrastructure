repository=api.wjrh.org:5000
name=icecast
host=10.49.1.1


build:
	sudo buildah build -f Containerfile --tag wjrh/$(name)

push:
	sudo buildah push --tls-verify=false wjrh/$(name) docker://$(repository)/$(name)

up: down
	ssh wjrh@$(host) sudo docker pull $(repository)/$(name)
	ssh wjrh@$(host) sudo docker run --rm --name $(name) -p 8000:8000 --detach $(repository)/$(name)
	
down: 
	-ssh wjrh@$(host) sudo docker kill $(name)
