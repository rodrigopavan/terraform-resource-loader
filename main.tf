provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#provider "azurerm" {
#  features {}
#}

#provider "google" {
#  project     = "my-project-id"
#  region      = "us-central1"
#}

#responsible to manage aws resources
module "aws" {
  source = "./modules/aws"
  for_each = var.vpcs
  vpc = each.value
  instances_per_subnet = var.instances_per_subnet
  instance_type = var.aws_instance_type
  azs = var.aws_azs
}

#responsible to manage azure resources
module "azure" {
  source = "./modules/azure"
}

#responsible to manage gcp resources
module "gcp" {
  source = "./modules/google"
}
