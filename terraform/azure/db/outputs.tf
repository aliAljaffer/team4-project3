output "psql_server_name" {
  description = "The name of the SQL server"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.name
}
output "psql_server_id" {
  description = "The ID of the SQL server"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.id
}
output "administrator_login_password" {
  sensitive = false
  value     = azurerm_postgresql_flexible_server.main_server.administrator_password
}
output "psql_database_name" {
  description = "The name of the SQL database"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server_database.psql_database.name
}

output "psql_server_fqdn" {
  description = "The fully qualified domain name of the SQL server"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.fqdn
}
