resource "azurerm_virtual_network" "main_vnet" {
  # 10.0.0.0/16
  name                = "${var.resource_prefix}-main-vnet"
  resource_group_name = var.rg_name
  location            = var.rg_location

  address_space = var.address_space
}
