data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

output "ami" {
  value = data.aws_ami.example
}
data "aws_instance" "foo" {
  instance_id = "i-092cd4f595a2d424d"
}

output "instance_public_ip_address" {
    value = data.aws_instance.foo.public_ip
}

data "aws_instance" "fool" {
  instance_id = "i-092cd4f595a2d424d"
}

output "instance_private_ip_address" {
  value = data.aws_instance.fool.private_ip
}