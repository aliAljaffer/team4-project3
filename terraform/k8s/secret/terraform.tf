resource "kubernetes_secret" "external_dns_aws" {
  metadata {
    name      = "external-dns-aws-credentials"
    namespace = "external-dns" # If not working, this is the isssssuuuuue
  }

  data = {
    aws_access_key_id     = var.aws_iam_access_key_id
    aws_secret_access_key = var.aws_iam_access_key_secret
  }

  type = "Opaque"
}
resource "kubernetes_secret" "cert_manager_route53" {
  metadata {
    name      = "external-dns-aws-credentials"
    namespace = "cert-manager"
  }

  data = {
    aws_access_key_id     = var.aws_iam_access_key_id
    aws_secret_access_key = var.aws_iam_access_key_secret
  }

  type = "Opaque"
}
