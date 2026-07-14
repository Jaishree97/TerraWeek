container_name = "jaishree-web"
external_port  = 8080
environment    = "dev"
image_tag      = "1.27-alpine"
enable_logs    = true

developer     = ["Jaishree", "Rahul", "Priya"]
allowed_ports = [80, 443, 8080]

server = {
  cpu      = 2
  memory   = 1024
  hostname = "web-server"
}

server_info = ["Ubuntu", 24, true]

docker_token = "dummy-token"

extra_labels = {
  owner = "Jaishree"
  team  = "TrainWithShubham"
}