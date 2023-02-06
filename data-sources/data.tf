data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["404676034670"]
}

output "ami" {
  value = "data.aws_ami.example"
}