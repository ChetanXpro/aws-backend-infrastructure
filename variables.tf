variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  default     = "default"
}

variable "backend_instance_type" {
  description = "EC2 instance type for the backend"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-0fa8fe6f147dc938b" 
}

variable "public_key_path" {
  description = "Path to the public key to be used for the EC2 instances"
  type        = string
}

variable "instance_name" {
  description = "Base name for resources"
  default     = "MyApp"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  default     = "0.0.0.0/0"  # restrict this in production
}

variable "db_name" {
  description = "Database name for the RDS PostgreSQL instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS PostgreSQL instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Username for the RDS PostgreSQL instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS PostgreSQL instance"
  type        = string
  sensitive   = true
}


variable "s3_bucket_name" {
  description = "Name of the S3 bucket to grant access to"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}