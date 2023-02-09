variable "map" {
  default = {
    students = 80
    name     = "nagababu"
    person   = yes
  }
}

output "map" {
  value = var.map["person"]
}