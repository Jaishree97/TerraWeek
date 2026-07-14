# --- Primitive types ---
variable "container_name" {
  description = "Name of the Docker container."
  type        = string
  default     = "terraweek-web"
}

variable "external_port" {
  description = "Host port to expose the container on."
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port > 1024 && var.external_port < 65535
    error_message = "external_port must be between 1025 and 65534."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

# --- Collection type ---
variable "image_tag" {
  description = "Nginx image tag to pull."
  type        = string
  default     = "1.27-alpine"
}

variable "extra_labels" {
  description = "Additional labels to attach to the container."
  type        = map(string)
  default = {
    team = "trainwithshubham"
  }
}

# Boolean Variables
variable "enable_logs" {
  description = "Enable container logging."
  type        = bool
  default     = true
}
# List Variables
variable "developer" {
  description = "List of developers working on this project."
  type        = list(string)
  default     = ["jaishree", "Rahul", "Priya"]
}

# Set Variables
variable "allowed_ports" {
  description = "Set of allowed ports for the container."
  type        = set(number)
  default     = [8080, 8081, 8082]
}

# Object Variable
variable "server" {
  description = "Server configuration."
  type = object({
    cpu      = number
    memory   = number
    hostname = optional(string)
  })

  default = {
    cpu    = 2
    memory = 1024
  }
}

# tuple Variable
variable "server_info" {
  description = "Server information."
  type        = tuple([string, number, bool])
  default     = ["Ubuntu", 24, true]
}

# sensitive Variable
variable "docker_token" {
  description = "Docker Hub token for private image access."
  type        = string
  sensitive   = true
  default     = "Dummy-token"
}
