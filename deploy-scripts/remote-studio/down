#!/bin/bash

image_repository=api.wjrh.org:5000
image_directory=remote-studio
host_address=remote.wjrh.org
host_user=wjrh

# host_do will perform the command on the host machine over ssh
host_do="ssh $host_user@$host_address"

$host_do cd "deploy/remote-studio && docker-compose down && docker-compose logs"
