resource "azurerm_resource_group" "main_rg" {
  name     = "${var.resource_prefix}-rg"
  location = var.location
}
