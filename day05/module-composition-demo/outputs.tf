output "vpc_id" {

  value = module.vpc.vpc_id

}


output "public_subnet" {

  value = module.vpc.public_subnets[0]

}


output "instance_id" {

  value = module.web_server.instance_id

}


output "public_ip" {

  value = module.web_server.public_ip

}