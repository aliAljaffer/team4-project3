variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "author" {
  type        = string
  description = "Author of the resources"
}
variable "acr_registry_name" {
  type    = string
  default = "alis-reg"
}
variable "acr_registry_sku" {
  type    = string
  default = "Standard"
}
variable "resource_prefix" {
  type        = string
  description = "Resource prefix to add to the names"
}
