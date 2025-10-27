output "acr_login" {
  value = module.az_acr.cr_link
}
output "kube_config" {
  value     = module.az_aks.kube_config
  sensitive = true
}
output "kv_uri" {
  value = module.az_kv.vault_uri
}
output "aks_name" {
  value = module.az_aks.aks_name
}
