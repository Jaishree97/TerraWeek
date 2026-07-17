module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.0"

  name = "composition-vpc"

  cidr = "10.50.0.0/16"

  azs = ["us-east-1a"]

  public_subnets = [
    "10.50.1.0/24"
  ]

  enable_nat_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}

resource "aws_security_group" "web" {

  name = "composition-sg"

  description = "Allow SSH"

  vpc_id = module.vpc.vpc_id

  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

}

module "web_server" {

  source = "git::https://github.com/Jaishree97/terraform-aws-ec2-module.git?ref=v1.0.0"

  name = "composition-demo"

  instance_type = "t3.micro"

  environment = "dev"

  ami = data.aws_ami.al2023.id

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  tags = {
    Owner = "Jaishree"
    Purpose = "Module Composition Demo"
  }

}