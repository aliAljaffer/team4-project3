output "ext_dns_secret_ref" {
  value = kubernetes_secret.external_dns_aws.metadata[0].name
}
output "cert_manager_secret_ref" {
  value = kubernetes_secret.cert_manager_route53.metadata[0].name
}
