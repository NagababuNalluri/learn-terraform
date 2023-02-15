resource "aws_instance" "web" {
  ami = data.aws_ami.centos.id
  instance_type = "t3.micro"
  tags = {
    Name = "Testone"
  }
}
data "aws_ami" "centos" {
  most_recent = true
  owners = ["973714476881"]
}