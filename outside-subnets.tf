# data "aws_vpc" "awsb37" {
#   id = "vpc-070f81ebcff8b4255"
# }



# resource "aws_subnet" "subnet4-public" {
#   #arguments
#   vpc_id            = data.aws_vpc.awsb37.id
#   #cidr_block        = "172.31.1.0/24"
#   availability_zone = "ap-south-1a"

#   tags = {
#     Name = "${var.public_subnet1_name}"
#   }

# }

