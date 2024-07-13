# terraform-hw1

#This Terraform configuration creates an AWS key pair, security group, and EC2 instance.

## Variables

- `region`: The AWS region to deploy the resources.
- `key_name`: The name of the key pair.
- `ports`: List of ports to allow (default: [22, 80, 443]).
- `availability_zone`: The availability zone for the instance.
- `instance_type`: The type of instance.
- `ami_id`: The AMI ID for the instance.
- `instance_count`: The number of instances to create.

## Using tfvars Files

To deploy the infrastructure using a specific region's variables:

# terraform init
# terraform apply -var-file=us-east-1.tfvars
# terraform destroy -var-file=us-east-1.tfvars