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

variable "public_subnets" {
  description = "Map of public subnets to create, keyed by AZ"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnets to create, keyed by AZ"
  type        = map(string)
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
}

variable "create_nat_gateway" {
  description = "Whether to create NAT gateways or not"
  type        = bool
}
