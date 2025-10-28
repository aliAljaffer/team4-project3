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
variable "db_host" {
  type        = string
  description = "Hostname name of the DB"
  sensitive   = true
}
variable "db_name" {
  type        = string
  description = "Name of the DB"
  sensitive   = true
}
variable "db_server" {
  type        = string
  description = "Server name of the DB"
  sensitive   = true
}
variable "db_password" {
  type        = string
  description = "Password of the DB admin"
  sensitive   = true
}
variable "db_user" {
  type        = string
  description = "Username of the DB admin"
  sensitive   = true
}
variable "acr_login" {
  type        = string
  description = "Login server for the ACR"
  sensitive   = false
}
variable "azure_storage_conn_string" {
  type        = string
  description = "Connection string for the storage account"
  sensitive   = true
}
variable "azure_storage_container" {
  type        = string
  description = "Azure Storage Account container name"
  sensitive   = true
}
variable "azure_storage_acc_name" {
  type        = string
  description = "Azure Storage Account Name"
  sensitive   = true
}
variable "azure_storage_acc_key" {
  type        = string
  description = "Azure Storage Account Key"
  sensitive   = true
}
variable "app_principal_id" {
  type        = string
  description = "Application user-assigned ID - Principal ID"
}
