# Config file for the client node on the api server at api.wjrh.org

#increase log verbosity
log_level = "INFO"

# Setup data dir
data_dir = "/tmp/client1"

# Give the agent a unique name. Defaults to hostname
name = "api"

# Enable the client
client {
	enabled = true
	servers = ["api.wjrh.org:4647"]
}

# Modify our port to avoid a collision with server1
ports {
	http = 5656
}

# Disable the dangling container cleanup to avoid interaction with other clients
plugin "docker" {
	config {
		gc {
			dangling_containers {
				enabled = false
			}
		}
	}
}
