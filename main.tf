module "aws" {
    source = "./modules/aws"
    aws_access_key = var.aws_access_key 
    aws_secret_key = var.aws_secret_key
    aws_region =  var.aws_region
    vpcs = var.vpcs
    zones = var.zones
    records_per_zone = var.records_per_zone
    record_a_values = var.record_a_values
    instances_per_subnet = var.instances_per_subnet
    aws_azs = var.aws_azs
    aws_instance_type = var.aws_instance_type
}

#responsible to manage azure resources
module "azure" {
  source = "./modules/azure"
}

#responsible to manage gcp resources
module "gcp" {
  source = "./modules/google"
}
