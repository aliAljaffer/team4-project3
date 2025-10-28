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
variable "node_rg" {
  type    = string
  default = "team4-nodes"
}
variable "vm_size_system_pool" {
  type    = string
  default = "Standard_A2_v2"
}
variable "vm_size_user_pool" {
  type    = string
  default = "Standard_A2_v2"
}
variable "domain_to_use" {
  type        = string
  default     = "alialjaffer.com"
  description = "apex domain"
}
variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}
variable "service_account_name" {
  type    = string
  default = "catus-locatus"
}
variable "app_namespace" {
  type    = string
  default = "team4project3"
}
