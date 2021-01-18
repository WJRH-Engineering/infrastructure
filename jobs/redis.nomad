job "redis" {
	datacenters = ["dc1"]	
	type = "service"

	update {
		max_parallel = 1
		min_healthy_time = "10s"
		healthy_deadline = "3m"
		progress_deadline = "10m"
		auto_revert = false
		canary = 0
	}

	migrate {
		max_parallel = 1
		health_check = "checks"
		min_healthy_time = "10s"
		healthy_deadline = "5m"
	}

	group "cache" {
		count = 1

		network {
			mode = "bridge"
			port "db" {
				static = 6379
				to = 6379
			}
			port "icecast" {
				static = 8000
				to = 8000
			}
		}
		
		service {
			name = "redis-cache"
			tags = ["global", "cache"]
			port = "db"
		}
		
		task "redis" {
			driver = "docker"
			config {
				image = "redis:3.2"
				ports = ["db"]
			}
			
			resources {
				cpu    = 500 # 500 MHz
				memory = 256 # 256MB
			}
		}

		task "icecast" {
			driver = "docker"
			config {
				image = "infiniteproject/icecast:latest"
				ports = ["icecast"]
			}
			
			resources {
				cpu    = 500 # 500 MHz
				memory = 256 # 256MB
			}
		}
	}
}
