resource "aws_s3_bucket" "mybucket1" {
  bucket = "${lower(var.vpc_name)}-mybucket1"

  tags = {
    Name        = "${lower(var.vpc_name)}-mybucket1"
    Environment = "${var.environment}"
  }
depends_on = [
    aws_subnet.subnet3-public
  ]
}
