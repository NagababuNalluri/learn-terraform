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
  tags = {
    Name = "Ec2-test"
  }
}
terraform {
  backend "s3" {
    bucket = "terraform-nag-b70"
    key    = "resources"
    region = "us-east-1"
  }
}