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
    token = "ygyIiXMgLicstw.atlasv1.KYesbOEtXVl9KlkJ8C9nfzgWCMzlGHFzaqOgqImAhnlaQtH0HN2ShvTWT0W5HRw2abI"
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