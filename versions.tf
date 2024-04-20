terraform {
  required_version = "~> 1.4"

  required_providers {
    aws = {
      version = "~> 5.0"

    }
  }
}

  provider "aws" {
    region = var.region
  }