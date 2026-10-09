variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 Key Pair for SSH access"
  type        = string
}