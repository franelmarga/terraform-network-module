# Terraform AWS Network Module

This module is called `terraform-module-networks` and it's designed to create and manage AWS networking resources such as VPCs, subnets, and NAT gateways across multiple availability zones.

## Requirements

- Terraform `~> 1.4`
- AWS provider `~> 5.0`

Ensure that you have the above requirements installed and configured before proceeding with the usage of this module.

## Providers

- AWS (`hashicorp/aws`)

This module is built specifically for the AWS provider and will not work with other cloud providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `env` | Environment for the network deployment (e.g. 'dev', 'staging', 'prod'). | `string` | n/a | yes |
| `region` | AWS region to deploy the network resources. | `string` | n/a | yes |
| `vpc_cidr` | The CIDR block for the VPC. | `string` | n/a | yes |
| `availability_zones` | List of availability zones in which to create subnets. | `list(string)` | n/a | yes |
| `public_subnets` | Map of public subnet CIDR blocks keyed by availability zone. | `map(string)` | n/a | yes |
| `private_subnets` | Map of private subnet CIDR blocks keyed by availability zone. | `map(string)` | n/a | yes |
| `create_nat_gateway` | Whether to create NAT gateways for private subnets. | `bool` | `true` | no |
| `repo_tags` | Common tags to apply to all resources in the module. | `map(string)` | `{}` | no |
| `env_tags` | Tags specific to the environment where the network is being deployed. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | The ID of the VPC created by the module. |
| `public_subnet_ids` | The IDs of the public subnets created by the module. |
| `private_subnet_ids` | The IDs of the private subnets created by the module. |
| `internet_gateway_id` | The ID of the Internet Gateway created by the module. |
| `public_network_acl_id` | The IDs of the private subnets created by the module. |
| `private_network_acl_id` | The ID of the Internet Gateway created by the module. |

## Example

To use this module in your Terraform configuration, use the following syntax:

```
module "network" {
  source  = "git::https://github.com/franelmarga/terraform-network-module.git?ref=1.0.1"

  env                = "dev"
  region             = "us-west-2"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets     = {
    "us-west-2a" = "10.0.1.0/24",
    "us-west-2b" = "10.0.2.0/24",
    "us-west-2c" = "10.0.3.0/24"
  }
  private_subnets    = {
    "us-west-2a" = "10.0.101.0/24",
    "us-west-2b" = "10.0.102.0/24",
    "us-west-2c" = "10.0.103.0/24"
  }
  create_nat_gateway = true
  repo_tags          = {
    "Owner" = "YourName",
    "Environment" = "dev"
  }
  env_tags           = {
    "Name" = "MyApp",
    "Environment" = "dev"
  }
}
```