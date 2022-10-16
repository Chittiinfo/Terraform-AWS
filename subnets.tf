resource "aws_subnet" "subnet1-public" {
    #arguments
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
depends_on = [
    aws_internet_gateway.default
  ]
}

resource "aws_subnet" "subnet2-public" {
    #arguments
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "ap-south-1b"

    tags = {
        Name = "${var.public_subnet2_name}"
    }
depends_on = [
    aws_subnet.subnet1-public
  ]
}

resource "aws_subnet" "subnet3-public" {
    #arguments
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "${var.public_subnet3_cidr}"
    availability_zone = "ap-south-1b"

    tags = {
        Name = "${var.public_subnet3_name}"
    }
depends_on = [
    aws_subnet.subnet2-public
  ]
}