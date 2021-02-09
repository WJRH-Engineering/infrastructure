#!/bin/bash

repository=api.wjrh.org:5000
image=broadcast-contol

docker build -t $repository/$image . &&
	docker push $repository/$image
