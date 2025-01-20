# AWS Infrastructure with Terraform

Terraform configuration for my backend infrastructure on AWS.

## Prerequisites

- Terraform >= 1.9.2
- AWS CLI configured with appropriate permissions
- SSH key pair for EC2 access

## Setup

1. Clone the repository
2. Copy `terraform.tfvars.example` to `terraform.tfvars`
3. Update `terraform.tfvars` with your values:
   - Set your AWS region and profile
   - Update SSH key path
   - Configure database credentials
   - Set unique S3 bucket name
   - Configure allowed IP ranges for SSH access
4. Run `terraform init` to initialize providers
5. Run `terraform plan` to preview changes
6. Run `terraform apply` to create infrastructure

## Infrastructure Components

- VPC with public subnets in multiple availability zones
- RDS PostgreSQL 16.3 database instance
- Private S3 bucket with CORS configuration
- EC2 instance for backend application
- Security groups for EC2 and RDS
- IAM roles for S3 access

## Important Notes

- The EC2 instance will have access to the S3 bucket via IAM role
- RDS is accessible only from the backend EC2 instance
- S3 bucket is private by default
- All resources are tagged with the instance name

## Clean Up

To destroy all created resources:

```bash
terraform destroy
```
