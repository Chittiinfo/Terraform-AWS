#This Terraform Code Deploys Basic VPC Infra.
terraform {
  backend "s3" {
    bucket = "chitti7702"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    # dynamodb_table = "terraform-state-lock-dynamo"
    # encrypt = true
  }

  required_version = "v1.2.0" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source = "hashicorp/aws"
    }
  }
  
}

provider "aws" {
  # profile = "default"
  # region  = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}


resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
	Owner = "Sreeharsha Veerapalli"
	environment = "${var.environment}"
    }
}