#!/bin/bash

repository=api.wjrh.org:5000
image=broadcast-controller

docker build -t $repository/$image . &&
	docker push $repository/$image
