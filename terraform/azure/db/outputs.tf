output "psql_server_name" {
  description = "The name of the SQL server (DB_SERVER)"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.name
}
output "psql_server_id" {
  description = "The ID of the SQL server"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.id
}
output "administrator_login_password" {
  sensitive   = true
  value       = azurerm_postgresql_flexible_server.main_server.administrator_password
  description = "(DB_PASSWORD)"
}
output "administrator_login" {
  sensitive   = true
  value       = azurerm_postgresql_flexible_server.main_server.administrator_login
  description = "(DB_USER)"
}
output "psql_database_name" {
  description = "The name of the SQL database (DB_NAME)"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server_database.psql_database.name
}

output "psql_server_fqdn" {
  description = "The fully qualified domain name of the SQL server (DB_HOST)"
  sensitive   = false
  value       = azurerm_postgresql_flexible_server.main_server.fqdn
}
