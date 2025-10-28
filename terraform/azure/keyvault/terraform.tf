resource "azurerm_key_vault" "kvault" {
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  name                          = "${var.author}-13nv2-kv"
  sku_name                      = "standard"
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment        = true
  public_network_access_enabled = true
  rbac_authorization_enabled    = false

  access_policy {
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id

    key_permissions         = ["Get", "List", "Update", "Delete", "Recover", "Backup", "Restore"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Delete", "Recover", "Backup", "Restore"]
  }

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Allow"
    virtual_network_subnet_ids = var.subnet_ids
  }
}

resource "azurerm_key_vault_access_policy" "catus_locatus_access" {
  key_vault_id = azurerm_key_vault.kvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.app_principal_id # Principal ID

  secret_permissions = [
    "Get", "List"
  ]
}

resource "azurerm_key_vault_secret" "db_user" {
  name         = "DB-USER"
  value        = var.db_user
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "db_password" {
  name         = "DB-PASSWORD"
  value        = var.db_password
  key_vault_id = azurerm_key_vault.kvault.id
  content_type = "password"
}
resource "azurerm_key_vault_secret" "db_host" {
  name         = "DB-HOST"
  value        = var.db_host
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "db_name" {
  name         = "DB-NAME"
  value        = var.db_name
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "db_server" {
  name         = "DB-SERVER"
  value        = var.db_server
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "azure_storage_conn_string" {
  name         = "AZURE-STORAGE-CONNECTION-STRING"
  value        = var.azure_storage_conn_string
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "azure_storage_container" {
  name         = "AZURE-STORAGE-CONTAINER"
  value        = var.azure_storage_container
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "azure_storage_acc_key" {
  name         = "AZURE-STORAGE-ACCOUNT-KEY"
  value        = var.azure_storage_acc_key
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "azure_storage_acc_name" {
  name         = "AZURE-STORAGE-ACCOUNT-NAME"
  value        = var.azure_storage_acc_name
  key_vault_id = azurerm_key_vault.kvault.id
}
resource "azurerm_key_vault_secret" "acr_login" {
  name         = "ACR-LOGIN-SERVER"
  value        = var.acr_login
  key_vault_id = azurerm_key_vault.kvault.id
}

resource "azurerm_private_endpoint" "kv" {
  name                = "pe-keyvault"
  location            = var.rg_location
  resource_group_name = var.rg_name
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "kv-privatelink"
    private_connection_resource_id = azurerm_key_vault.kvault.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  private_dns_zone_group {
    name                 = "kv-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.kv.id]
  }
}

# DNS for private endpoint
resource "azurerm_private_dns_zone" "kv" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "kv" {
  name                  = "kv-dns-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.kv.name
  virtual_network_id    = var.main_vnet_id
}
