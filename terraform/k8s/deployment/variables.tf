variable "external_dns_access_key_id" {
  type        = string
  sensitive   = true
  description = "ACCESS KEY ID"
}
variable "external_dns_access_key_secret" {
  type        = string
  sensitive   = true
  description = "ACCESS KEY SECRET"
}
variable "az_aks_name" {
  type        = string
  description = "AKS Cluster name"
}
variable "ext_dns_sa_name" {
  type        = string
  description = "External DNS Service Account name"
}
variable "ext_dns_secret_ref" {
  type = string
}
