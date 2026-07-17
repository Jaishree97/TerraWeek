variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
  default     = "day05-vpc"
}