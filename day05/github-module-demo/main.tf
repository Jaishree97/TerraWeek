module "github_web_server" {

  source = "git::https://github.com/Jaishree97/terraform-aws-ec2-module.git?ref=v1.0.0"

  name                   = "github-demo"
  instance_type          = "t3.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids

  tags = {
    Owner  = "Jaishree"
    Module = "GitHub"
  }

}