provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "GAOXUE"
    workspaces {
      name="terraform-test"
    }
    token = "fRZ0FFtOfpyscA.atlasv1.lyqzXFD3ODLFLM3XCpjsY9EnpcIXmAW6VzWnrS8KXZGubw6QJP1Y97gSigh0llUuz94"
  }
}

resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }
}