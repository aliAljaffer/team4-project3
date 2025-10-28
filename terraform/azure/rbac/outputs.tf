output "app_id" {
  value       = azurerm_user_assigned_identity.catus_locatus_identity.principal_id
  description = "Application user-assigned ID - Principal ID"
}
