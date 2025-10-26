resource "azurerm_storage_account" "uploads_sa" {
  name                          = "${var.resource_prefix}storage"
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = true
}

resource "azurerm_storage_container" "uploads_cntnr" {
  name                  = "${var.resource_prefix}uploads"
  storage_account_id    = azurerm_storage_account.uploads_sa.id
  container_access_type = "container"
}
