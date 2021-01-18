# WJRH Infrastructure

## Setting up a new client node

- Make a new config file using client.hcl as a template, add it to the clients directory so it can be version controlled
- Make a any necessary changes. Make sure you change the name so it is unique
- Copy the client.hcl file to /etc/nomad.d/client.hcl
- Copy the nomad-client.service file to /etc/systemd/system/nomad-client.service
- ```bash sudo systemctl start nomad-client # to start the node immediately```
- ```bash sudo systemctl enable nomad-client # to tell systemd to start this service automatically on boot from now on```
