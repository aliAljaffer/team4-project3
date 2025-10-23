variable "resource_prefix" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "db_subnet_cidr" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}
variable "cluster_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "endpoint_subnet_cidr" {
  type    = list(string)
  default = ["10.0.3.0/24"]
}
