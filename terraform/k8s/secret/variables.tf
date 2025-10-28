variable "aws_iam_access_key_id" {
  type        = string
  sensitive   = true
  description = "ACCESS KEY ID"
}
variable "aws_iam_access_key_secret" {
  type        = string
  sensitive   = true
  description = "ACCESS KEY SECRET"
}
variable "k8s_ns" {
  type        = string
  description = "K8s Namespace"
}
