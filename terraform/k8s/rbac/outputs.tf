output "app_service_account_name" {
  value = kubernetes_service_account.catus_locatus_sa.metadata[0].name
}
output "ext_dns_service_account_name" {
  value = kubernetes_service_account.ext_dns_sa.metadata[0].name
}
