output "app_principal_id" {
  value       = azurerm_user_assigned_identity.catus_locatus_identity.principal_id
  description = "Application user-assigned ID - Principal ID"
}
output "app_client_id" {
  value       = azurerm_user_assigned_identity.catus_locatus_identity.client_id
  description = "Application user-assigned ID - Client ID"
}
