resource "aws_instance" "web-1" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}Server-1"
    Env        = var.environment
    Owner      = "Nag"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform-NAG</h1>" | sudo tee /var/www/html/index.html
        echo "<center><h1>Welcome To Devops-NAG</h1></center> | sudo tee -a /var/www/html/index.html
	EOF

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [tags] # to ignore changes that you made manually at Ec2 instance level
  }
}
