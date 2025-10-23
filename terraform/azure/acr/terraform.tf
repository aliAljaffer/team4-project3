resource "azurerm_container_registry" "cr" {
  name                = var.acr_registry_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = var.acr_registry_sku

  public_network_access_enabled = false

  anonymous_pull_enabled     = true
  network_rule_bypass_option = "AzureServices"
}
