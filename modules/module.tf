provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-nag-b70"
    key    = "modules/terraform.tfstatefile"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "./ec2"
  security_group_id = module.sg.security_group_id
}
module "sg" {
  source = "./sg"
}

