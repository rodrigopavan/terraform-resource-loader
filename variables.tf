variable "vpcs" {
    description = "Number of desired vpcs and subnets to be created"
    type = map(object({
      cidr      = string
      name      = string
      subnets   = number
      bits      = number
    }))
}

variable "instances_per_subnet" {
    description = "How many instances must be created per subnet"
    type = number
    default = 1
}

variable "aws_access_key" {
    description = "AWS Access Key"
    type = string
}

variable "aws_secret_key" {
    description = "AWS Secret Key"
    type = string
}

variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "aws_azs" {
    description = "AWS AZs used to create resources"
    type = list(string)
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "aws_instance_type" {
    description = "Which AWS Instance Type should be created"
    type = string
    default = "t2.nano"
}
