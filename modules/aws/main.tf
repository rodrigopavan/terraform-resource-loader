provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#responsible to manage aws ipam resources
module "aws_ipam" {
  source = "./ipam"
  for_each = var.vpcs
  vpc = each.value
  instances_per_subnet = var.instances_per_subnet
  instance_type = var.aws_instance_type
  azs = var.aws_azs
}

#responsible to manage aws dns resources
module "aws_dns" {
  source = "./dns"
  count = var.zones
  zone_name = format("dns%d.com",count.index)
  records_per_zone = var.records_per_zone 
  record_a_values = var.record_a_values
}
