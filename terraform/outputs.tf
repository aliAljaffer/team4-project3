output "acr_login" {
  value = module.acr.cr_link
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}
output "psql_info" {
  value = {
    fqdn    = module.db.psql_server_fqdn
    db_name = module.db.psql_database_name
  }
}
output "kv_uri" {
  value = module.kv.vault_uri
}
output "aks_name" {
  value = module.aks.aks_name
}
