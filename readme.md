## Terraform Compute Example on BinaryLane
Installs docker

## How to use. 
- Create a file and name it `terraform.tfvars`.
- Insert UserID/Email and the 32character api key. 
    - e.g `binarylane_email = "email@email.com"`
- Run `terraform init` - Sets up openstack.
- Run `terraform apply` Creates the compute resource.

## Pre-req. 
- Terraform 0.12
- Binarylane acc.
- Basic understanding of your openstack provider 