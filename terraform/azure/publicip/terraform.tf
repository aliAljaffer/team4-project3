resource "azurerm_public_ip" "ingress_ip" {
  name                = "${var.resource_prefix}-ip"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}
