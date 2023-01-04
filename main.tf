provider "aws" {
  region = "ap-northeast-1"
  access_key = "AKIAS662AALL3BMYB42P"
  secret_key = "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"
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