variable "resource_prefix" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
