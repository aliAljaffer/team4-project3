output "acr_login" {
  value = module.acr.cr_link
}
output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}
output "kv_uri" {
  value = module.kv.vault_uri
}
output "aks_name" {
  value = module.aks.aks_name
}
