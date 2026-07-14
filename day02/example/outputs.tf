output "container_name" {
  description = "Full name of the running container."
  value       = docker_container.web.name
}

output "access_url" {
  description = "URL to reach the Nginx welcome page."
  value       = format("http://localhost:%d", var.external_port)
}

output "image" {
  description = "The image the container is running."
  value       = docker_image.nginx.name
}

output "uppercase_developers" {
  description = "Developer names in uppercase."
  value       = local.uppercase_developers
}

output "instance_size" {
  description = "Computed instance size based on environment."
  value       = local.instance_size
}

output "common_labels" {
  description = "Merged labels applied to the container."
  value       = local.common_labels
}