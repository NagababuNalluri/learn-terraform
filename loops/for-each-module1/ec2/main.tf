resource "aws_instance" "web" {
  ami = data.aws_ami.centos.id
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}
data "aws_ami" "centos" {
  most_recent = true
  owners = ["973714476881"]
}

variable "instance_type" {}

variable "name" {}

output "one" {
  value = aws_instance.web
}