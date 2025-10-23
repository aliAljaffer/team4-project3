variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "pe_subnet_id" {
  type = string
}
variable "main_vnet_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "author" {
  type        = string
  description = "Author of the resources"
}
variable "resource_prefix" {
  type        = string
  description = "Resource prefix to add to the names"
}
