variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Target AWS region"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for VPC"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for public subnet"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance size"
}

variable "key_name" {
  type        = string
  description = "Name of your existing AWS SSH Key Pair"
}


