resource "kubernetes_service_account" "catus_locatus_sa" {
  metadata {
    name      = var.sa_name
    namespace = var.app_ns
    annotations = {
      "azure.workload.identity/client-id" = var.app_id
    }
  }
}
