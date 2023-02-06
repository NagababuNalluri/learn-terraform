variable "ex" {
  default = 30
}

output "ex" {
  value = var.ex
}

variable "firstname" {
  default = "nalluri"
}
output "firstname" {
  value = var.firstname
}

variable "lastname" {
  default = "nagababu"
}
output "lastname" {
  value = var.lastname
}

# default_variables
variable "default_variables" {
  default = 9985
}
output "default_variables" {
  value = var.default_variables
}

#list_variables
variable "list_variables" {
  default = [
    100,
    "nag",
    true
  ]
}

output "list_variables" {
  value = var.list_variables[1]
}

# map_variables
variable "map_variables" {
  default = {
    string = "raj"
    number = 143
    boolean = false
  }
}
output "map_variables" {
  value = var.map_variables["boolean"]
}