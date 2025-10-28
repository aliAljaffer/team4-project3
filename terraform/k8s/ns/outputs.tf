output "ns_cm" {
  value = kubernetes_namespace.cert_manager.metadata[0].name
}
output "ns_edns" {
  value = kubernetes_namespace.external_dns.metadata[0].name
}
output "app_ns" {
  value = kubernetes_namespace.app_ns.metadata[0].name
}

output "ingress_object" {
  value = kubernetes_namespace.ingress_nginx
}
