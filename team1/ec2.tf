resource "aws_instance" "web-1" {
  ami = "ami-062df10d14676e201"
  #ami = "ami-0d857ff0f5fc4e03b"
  #ami = "${data.aws_ami.my_ami.id}"
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.micro"
  key_name                    = "Devops"
  subnet_id                   = data.terraform_remote_state.remote.outputs.subnet1
  vpc_security_group_ids      = ["${data.terraform_remote_state.remote.outputs.sg}"]
  associate_public_ip_address = true
  tags = {
    #     Name = "Server-1"
    #     Env = "Prod"
    #     Owner = "Sree"
    # CostCenter = "ABCD"
  }
}