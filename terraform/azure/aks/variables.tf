variable "resource_prefix" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "node_rg" {
  type = string
}
variable "vm_size" {
  type    = string
  default = "Standard_B2_v2"
}
variable "node_count" {
  type    = number
  default = 2
}
variable "min_count" {
  type    = number
  default = 2
}
variable "max_count" {
  type    = number
  default = 5
}
variable "cluster_subnet_id" {
  type = string
}
variable "cluster_subnet_cidr" {
  type = string
}
