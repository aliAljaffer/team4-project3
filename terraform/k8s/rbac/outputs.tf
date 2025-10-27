output "service_account_name" {
  value = kubernetes_service_account.catus_locatus_sa.metadata[0].name
}
