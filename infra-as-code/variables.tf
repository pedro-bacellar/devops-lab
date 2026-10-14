
variable "aws_region" {
  description = "AWS region for application resources"
  type        = string
  default     = "us-east-2"
}

variable "ami_id" {
  description = "AMI ID used by the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile attached to EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR allowed to access SSH"
  type        = string
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "site_prod"
}

