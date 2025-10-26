output "storage_account_id" {
  value = azurerm_storage_account.uploads_sa.id
}
output "container_id" {
  value = azurerm_storage_container.uploads_cntnr.id
}
output "storage_account_name" {
  value       = azurerm_storage_account.uploads_sa.name
  description = "(AZURE_STORAGE_ACCOUNT_NAME)"
}
output "storage_account_conn_string" {
  value       = azurerm_storage_account.uploads_sa.primary_connection_string
  description = "(AZURE_STORAGE_CONNECTION_STRING)"
}
output "storage_account_key" {
  value       = azurerm_storage_account.uploads_sa.primary_access_key
  description = "(AZURE_STORAGE_ACCOUNT_KEY)"
}

output "container_name" {
  value       = azurerm_storage_container.uploads_cntnr.name
  description = "(AZURE_STORAGE_CONTAINER)"
}

