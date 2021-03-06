#!/bin/bash

repository=api.wjrh.org:5000

# remove file extension from input
strip_ext () { echo $1 | cut -f 1 -d '.'; }
 
for file in *.docker; do
	image=$(strip_ext $file)
	docker build -t $repository/remote-studio/$image -f $file . &&
		docker push $repository/remote-studio/$image
done
