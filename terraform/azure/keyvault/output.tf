output "vault_uri" {
  value = azurerm_key_vault.kvault.vault_uri
}
output "kv_id" {
  value = azurerm_key_vault.kvault.id
}
output "kv_name" {
  value = azurerm_key_vault.kvault.name
}
output "secret_to_key" {
  value = {
    for secret in local.secrets :
    secret.name => replace(secret.name, "-", "_")
  }
}
