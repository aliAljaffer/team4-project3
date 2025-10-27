output "vnet_name" {
  value = azurerm_virtual_network.main_vnet.name
}
output "vnet_id" {
  value = azurerm_virtual_network.main_vnet.id
}
output "vnet_address_space" {
  value = one(azurerm_virtual_network.main_vnet.address_space)
}
