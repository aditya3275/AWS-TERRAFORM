terraform {
  backend "s3" {
    bucket       = "bacc-bucct"
    key          = "dev/Terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "Firstbuck" {
  bucket = "aditya-terrabucket"

  tags = {
    Name        = "My bucket 6.0"
    Environment = "Dev"
  }
}

resource "aws_vpc" "my-vpcc" {
  cidr_block = "10.0.0.0/16"


  tags = {
    Name        = "my-vpcc"
    Environment = "Dev"
  }
}
