# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

datacenter="dc1"
data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

advertise {
	http = "54.224.153.213"
	rpc = "54.224.153.213"
	serf = "54.224.153.213"
}

server {
  enabled = true
  bootstrap_expect = 1
}
