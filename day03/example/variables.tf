variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "name_prefix" {
  description = "Prefix applied to resource names."
  type        = string
  default     = "terraweek"
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 2
}

variable "allowed_ports" {
  description = "Allowed inbound ports."
  type        = list(number)
  default     = [22, 80, 443]
}

variable "install_nginx" {
  description = "Install Nginx during EC2 boot."
  type        = bool
  default     = true
}