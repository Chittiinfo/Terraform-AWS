resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Nag S"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "${var.IGW_name}"
  }
}


resource "aws_s3_bucket" "vpcflowlogsbucket" {
  bucket = "${lower(var.vpc_name)}-flowlogbucket"

  tags = {
    Name        = "${lower(var.vpc_name)}-flowlogbucket"
    Environment = "${var.environment}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_flow_log" "example" {
  log_destination      = aws_s3_bucket.vpcflowlogsbucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc1.id
  lifecycle {
    create_before_destroy = true
  }
}
