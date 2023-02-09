variable "map" {
  default = {
    students = 80
    name     = "nagababu"
    person   = false
  }
}

output "map" {
  value = var.map["person"]
}