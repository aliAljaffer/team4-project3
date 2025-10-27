output "kubelet_object_id" {
  value     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  sensitive = true
}
output "kubelet_principal_id" {
  value     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  sensitive = true
}
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
output "aks_name" {
  value     = azurerm_kubernetes_cluster.aks.name
  sensitive = false
}

output "aks_oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}
output "k8s_client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}
output "k8s_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}
output "k8s_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
}
output "k8s_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
}
