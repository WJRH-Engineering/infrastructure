#!/bin/bash

app_name=broadcast-controller
host_address=api.wjrh.org
host_user=wjrh

# host_do will perform the command on the host machine over ssh
host_do="ssh $host_user@$host_address"

$host_do mkdir -p deploy
$host_do mkdir -p deploy/$app_name

scp docker-compose.yml $host_user@$host_address:deploy/$app_name/docker-compose.yml

$host_do "cd deploy/$app_name && docker-compose up -d && docker-compose logs"
