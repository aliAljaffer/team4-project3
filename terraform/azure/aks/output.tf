# output "kubelet_object_id" {
#   value     = data.azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#   sensitive = true
# }
# output "kube_config" {
#   value     = data.azurerm_kubernetes_cluster.aks.kube_config_raw
#   sensitive = true
# }
output "kubelet_object_id" {
  value     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
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
