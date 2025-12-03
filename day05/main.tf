terraform {
  backend "s3" {
    bucket       = "bacc-bucct1"
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

variable "environment" {
  default = "dev"
  type    = string
}

variable "channel_name" {
  default = "aditya-terrabucket"

}
variable "region_name" {
  default = "us-east-1"
}
variable "vpc_name" {
  default = "my-vpcc"

}

locals {
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region_name}"
  vpc_name    = "${var.vpc_name}-VPC"

}

output "vpc_id" {
  value = aws_vpc.my-vpcc.id

}

output "ec2_id" {
  value = aws_instance.my_ec2.id

}
resource "aws_s3_bucket" "Firstbuck" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}




resource "aws_vpc" "my-vpcc" {
  cidr_block = "10.0.0.0/16"



  tags = {
    Name        = local.vpc_name
    Environment = var.environment
  }

}
resource "aws_instance" "my_ec2" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"



  tags = {
    Environment = var.environment
    Name        = "${var.environment}-ec2-instance"
  }
}








