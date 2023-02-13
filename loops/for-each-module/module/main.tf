resource "aws_instance" "web" {
  ami = data.aws_ami.centos8.id
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}

data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
variable "instance_type" {}
variable "name" {}

output "public_ip" {
  value = aws_instance.web.public_ip
}
