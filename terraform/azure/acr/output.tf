
output "cr_id" {
  value = azurerm_container_registry.cr.id
}
output "cr_name" {
  value = azurerm_container_registry.cr.name
}
output "cr_link" {
  value = azurerm_container_registry.cr.login_server
}
