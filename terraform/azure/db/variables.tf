variable "psql_admin_username" {
  type        = string
  description = "the username for the SQL admin"
  sensitive   = true
}
variable "psql_admin_password" {
  type        = string
  description = "the password for the SQL admin"
  sensitive   = true
}

variable "psql_database_name" {
  type        = string
  default     = "project3db"
  description = "the name of the database"
}

variable "psql_server_version" {
  type        = string
  default     = "12.0"
  description = "the version of the SQL server"

}
variable "resource_prefix" {
  type = string
}
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "vnet_id" {
  type = string
}
variable "db_subnet_id" {
  type = string
}
variable "db_sku_name" {
  type    = string
  default = "B_Standard_B2s"
}
variable "vnet_address_space" {
  type = set(string)
}


