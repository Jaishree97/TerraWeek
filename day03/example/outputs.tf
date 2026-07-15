output "instance_ids" {
  description = "IDs of all EC2 instances."
  value       = aws_instance.web[*].id
}

output "public_ips" {
  description = "Public IPs of all EC2 instances."
  value       = aws_instance.web[*].public_ip
}

output "web_urls" {
  description = "URLs of all web servers."
  value = [
    for ip in aws_instance.web[*].public_ip :
    "http://${ip}"
  ]
}


output "ami_id" {
  description = "The Amazon Linux 2023 AMI resolved via the data source."
  value       = data.aws_ami.al2023.id
}

output "aws_region" {
  description = "AWS region used for deployment."
  value       = data.aws_region.current.region
}

output "elastic_ip" {
  description = "Elastic IP attached to EC2-1."
  value       = aws_eip.web.public_ip
}

output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public Subnet ID."
  value       = aws_subnet.public.id
}

output "availability_zones" {
  description = "Available Availability Zones."

  value = data.aws_availability_zones.available.names
}