output "external_dns_access_key_id" {
  value     = aws_iam_access_key.external_dns.id
  sensitive = true
}

output "external_dns_secret_access_key" {
  value     = aws_iam_access_key.external_dns.secret
  sensitive = true
}
