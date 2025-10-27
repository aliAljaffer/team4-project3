variable "secrets" {
  type        = map(string)
  sensitive   = true
  description = "map of secret names and their keys"
}
variable "app_id" {
  type = string
}
variable "app_client_id" {
  type = string
}
variable "app_ns" {
  type = string
}
variable "kv_name" {
  type = string
}
