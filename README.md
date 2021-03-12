Terraform responsible to populate AWS/Azure/GCP Resources (VirtualNetworks/Subnets/VMs) with random data.

Variable example:
``` terraform
aws_access_key = "ACCESS_KEY"
aws_secret_key = "SECRET_KEY"

vpcs = {
        "vpc1" = {
            cidr      = "10.0.0.0/16",
            name      = "vpc1",
            subnets   = 1,
            bits      = 8
        }           
    }
zones = 1
instances_per_subnet = 1
```

Excute only for AWS
``` shell 
terraform plan -target=module.aws
```
