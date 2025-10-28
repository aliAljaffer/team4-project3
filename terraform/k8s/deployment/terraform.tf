resource "kubernetes_deployment" "external_dns" {
  metadata {
    name      = "external-dns"
    namespace = "external-dns"
  }

  spec {
    strategy {
      type = "Recreate"
    }

    selector {
      match_labels = {
        app = "external-dns"
      }
    }

    template {
      metadata {
        labels = {
          app = "external-dns"
        }
      }

      spec {
        service_account_name = var.ext_dns_sa_name

        container {
          name  = "external-dns"
          image = "registry.k8s.io/external-dns/external-dns:v0.19.0"

          args = [
            "--source=ingress",
            "--domain-filter=alialjaffer.com",
            "--provider=aws",
            "--aws-zone-type=public",
            "--registry=txt",
            "--txt-owner-id=${var.az_aks_name}",
            "--policy=upsert-only"
          ]

          env {
            name  = "AWS_DEFAULT_REGION"
            value = "us-east-1"
          }

          env {
            name = "AWS_ACCESS_KEY_ID"
            value_from {
              secret_key_ref {
                name = var.ext_dns_secret_ref
                key  = "aws_access_key_id"
              }
            }
          }

          env {
            name = "AWS_SECRET_ACCESS_KEY"
            value_from {
              secret_key_ref {
                name = var.ext_dns_secret_ref
                key  = "aws_secret_access_key"
              }
            }
          }
        }
      }
    }
  }
}
