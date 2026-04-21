resource "aws_instance" "app" {
  count = 2
 
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
 
  subnet_id = var.private_subnets[count.index]
 
  vpc_security_group_ids = [var.ec2_sg]
 
  iam_instance_profile = var.instance_profile
 
  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install docker.io -y
systemctl start docker
EOF
}
