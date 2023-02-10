provider "aws" {
  region = "us-east-1"
}
data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

resource "aws_instance" "web" {
  ami = data.aws_ami.centos8.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls_provisioner.id]
  tags = {
    Name = "Ec2-test"
  }
}
resource "null_resource" "provision" {
  triggers = {
    instance_id = aws_instance.web.id
  }
  provisioner "remote-exec" {
    connection {
      host     = aws_instance.web.public_ip
      user     = "centos"
      password = "DevOps321"
    }
    inline = [
      "echo hello"
    ]
  }
}
resource "aws_security_group" "allow_tls_provisioner" {
  name        = "allow_tls_provisioner"
  description = "Allow tls inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls_provisioner"
  }
}