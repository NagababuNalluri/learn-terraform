resource "aws_instance" "web" {
  count = length(var.components)
  ami = data.aws_ami.example
  instance_type = "t3.micro"
  tags = {
    Name = var.components[count:index]
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