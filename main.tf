#This Terraform Code Deploys Basic VPC Infra.
terraform {
  backend "s3" {
    bucket = "chitti7702"
    key    = "ecommerce.tfstate"
    region = "ap-south-1"
  }
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "4.5.0"
      }
  }
}


provider "aws" {
    # profile = "default"
    # region  = "ap-south-1"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}