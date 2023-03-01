# awsvpc-terraform

## AWS Exercise/Terraform
Create an advanced AWS VPC spanning 2 AZs with both public and private subnets. An internet gateway and NAT gateway will be deployed into it. Public and private route tables will be established. An application load balancer (ALB) will be installed which will load balance traffic across an auto scaling group (ASG) of Nginx web servers. Security groups will be created and deployed to secure all network traffic between the various components.

#### Project Structure

```
├── ec2.userdata
├── main.tf
├── outputs.tf
├── terraform.tfvars/vars.tf
└── variables.tf
```

#### TF Variable Notes

- Terraform environment variables are documented here:
[https://www.terraform.io/cli/config/environment-variables](https://www.terraform.io/cli/config/environment-variables)
