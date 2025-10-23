variable "resource_prefix" {
  type    = string
  default = "t4-p3"
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "author_name" {
  type    = string
  default = "team4"
}
variable "subscription_id" {
  type      = string
  sensitive = true
}
variable "psql_admin_password" {
  type      = string
  sensitive = true
}
variable "psql_admin_username" {
  type = string
}
variable "acr_registry_sku" {
  type    = string
  default = "Premium"
}
variable "acr_registry_name" {
  type    = string
  default = "team4amazingregistry"
}
