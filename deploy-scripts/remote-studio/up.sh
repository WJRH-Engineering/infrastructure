#!/bin/bash

# -----------------------
# REMOTE STUDIO UP SCRIPT
# -----------------------
# Deploys Remote Studio to the production server and brings it up.
# Copies a production ready docker-compose file onto the server and runs
# docker-compose up

host_address=remote.wjrh.org
host_user=wjrh

# host_do will perform the command on the host machine over ssh
host_do="ssh $host_user@$host_address"

$host_do mkdir -p deploy
$host_do mkdir -p deploy/remote-studio

scp docker-compose.yml $host_user@$host_address:deploy/remote-studio/docker-compose.yml
scp config.toml $host_user@$host_address:deploy/remote-studio/config.toml

$host_do "cd deploy/remote-studio && docker-compose up -d && docker-compose logs"
