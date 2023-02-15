resource "aws_instance" "web" {
  for_each = var.components
  ami = data.aws_ami.centos.id
  instance_type = each.value.instance_type
  tags = {
    Name = each.value.name
  }
}
data "aws_ami" "centos" {
  most_recent = true
  owners = ["973714476881"]
}
variable "components" {
  default = {
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }
  }
}
output "publicip" {
  value = {for k,v in aws_instance.web : k => v.public_ip}
}