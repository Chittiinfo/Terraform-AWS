# resource "aws_s3_bucket" "mybucket1" {
#   bucket = "${lower(var.vpc_name)}-mybucket1"

#   tags = {
#     Name        = "${lower(var.vpc_name)}-mybucket1"
#     Environment = "${var.environment}"
#   }
# depends_on = [
#     aws_subnet.subnet3-public
#   ]
# }

# resource "aws_s3_bucket" "mybucket2" {
#   bucket = "${lower(var.vpc_name)}-mybucket2"

#   tags = {
#     Name        = "${lower(var.vpc_name)}-mybucket2"
#     Environment = "${var.environment}"
#   }
# depends_on = [
#     aws_subnet.subnet3-public
#   ]
# }
