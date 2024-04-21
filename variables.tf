variable "env" {
  type        = string
  description = "Environment"
}

variable "repo_tags" {
  type        = map(string)
  description = "Map of tags for the whole repo."
  default = {
    Owner = "franelmarga"
    IAC   = "https://github.com/franelmarga/terraform-exercise"
  }
}

variable "env_tags" {
  type        = map(string)
  description = "Map of tags for this environment"
}

variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
}

variable "create_nat_gateway" {
  description = "Whether to create NAT gateways or not"
  type        = bool
}

data "aws_availability_zones" "available" {
  state = "available"
}

