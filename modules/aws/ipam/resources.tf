terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "vpc" {  
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc.name
  cidr = var.vpc.cidr

  azs             = var.azs
  private_subnets = cidrsubnets(var.vpc.cidr, [for _ in range(var.vpc.subnets) : var.vpc.bits]...)

  tags = {
    Terraform = "true"
    Environment = "dev-cloud-sync-load-test"
  }
}

resource "aws_instance" "app" {
  count = var.instances_per_subnet * length(module.vpc.private_subnets)
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id  = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
