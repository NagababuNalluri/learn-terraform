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
module "one" {
  source = "./ec2"
  for_each = var.components
  instance_type = each.value.instance_type
  name = each.value.name
}

output "publicip" {
value = {for k,v in module.one : k => v["xyz"].public_ip}
}