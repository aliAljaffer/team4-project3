locals {
  secrets = [
    azurerm_key_vault_secret.db_user,
    azurerm_key_vault_secret.db_password,
    azurerm_key_vault_secret.db_host,
    azurerm_key_vault_secret.db_name,
    azurerm_key_vault_secret.db_server,
    azurerm_key_vault_secret.azure_storage_conn_string,
    azurerm_key_vault_secret.azure_storage_container,
    azurerm_key_vault_secret.azure_storage_acc_key,
    azurerm_key_vault_secret.azure_storage_acc_name,
    azurerm_key_vault_secret.acr_login,
  ]
}
