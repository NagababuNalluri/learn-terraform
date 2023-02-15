resource "aws_instance" "web" {
  count = 2
  ami = data.aws_ami.example.id
  instance_type = var.type[count.index]
  tags = {
    Name = var.components[count.index]
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}
variable "components" {
  default = ["cart","frontend"]
}
variable "type" {
  default = ["t3.micro","t3.small"]
}


output "publicip" {
  value = aws_instance.web.*.public_ip
}