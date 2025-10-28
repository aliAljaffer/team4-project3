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
variable "node_count_system_pool" {
  type    = number
  default = 2
}
variable "node_count_user_pool" {
  type    = number
  default = 2
}
variable "min_count_system_pool" {
  type    = number
  default = 2
}
variable "max_count_system_pool" {
  type    = number
  default = 5
}
variable "min_count_user_pool" {
  type    = number
  default = 2
}
variable "max_count_user_pool" {
  type    = number
  default = 3
}
variable "cluster_subnet_id" {
  type = string
}
variable "cluster_subnet_cidr" {
  type = string
}
variable "vm_size_system_pool" {
  type    = string
  default = "Standard_A2_v2"
}
variable "vm_size_user_pool" {
  type    = string
  default = "Standard_A2_v2"
}
variable "aks_node_service_cidr" {
  type    = string
  default = "10.2.0.0/16"
}
variable "aks_dns_service_ip" {
  type    = string
  default = "10.2.0.10"
}
variable "network_plugin" {
  type    = string
  default = "azure"
}
variable "temporary_name_for_rotation" {
  type    = string
  default = "team4tmpnm"
}
