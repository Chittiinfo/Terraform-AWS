resource "aws_s3_bucket" "mybucket1" {
  bucket = "${var.vpc_name}-mybucket1"

  tags = {
    Name        = "${var.vpc_name}-mybucket1"
    Environment = "${var.environment}"
  }
}
