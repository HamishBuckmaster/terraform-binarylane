## Terraform Compute Example on BinaryLane
Installs docker etc

## How to use. 
- rename `override.example_tf` to `override.tf`
- Insert UserID/Email and the 32character api key. 
- run `terraform init` - Sets up openstack.
- run `terraform apply` Creates the compute 

## Pre-req. 
- terraform. 0.12
- binarylane acc.
- basic understanding of your openstack provider 