resource "kubernetes_service_account" "catus_locatus_sa" {
  metadata {
    name      = var.sa_name
    namespace = var.app_ns
    annotations = {
      "azure.workload.identity/client-id" = var.app_id
    }
  }
}
resource "kubernetes_service_account" "ext_dns_sa" {
  metadata {
    name      = "external-dns"
    namespace = "external-dns"
  }
}

resource "kubernetes_cluster_role" "external_dns" {
  metadata {
    name = "external-dns"
  }

  rule {
    api_groups = [""]
    resources  = ["services", "endpoints", "pods"]
    verbs      = ["get", "watch", "list"]
  }

  rule {
    api_groups = ["extensions", "networking.k8s.io"]
    resources  = ["ingresses"]
    verbs      = ["get", "watch", "list"]
  }

  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["list"]
  }
}
resource "kubernetes_cluster_role_binding" "external_dns_viewer" {
  metadata {
    name = "external-dns-viewer"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.external_dns.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.ext_dns_sa.metadata[0].name
    namespace = "external-dns"
  }
}

resource "kubernetes_manifest" "letsencrypt_prod_dns" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod-dns"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = var.email
        privateKeySecretRef = {
          name = "letsencrypt-prod-dns"
        }
        solvers = [
          {
            dns01 = {
              route53 = {
                region       = "us-east-1"
                hostedZoneID = var.hosted_zone_id
                accessKeyIDSecretRef = {
                  name = "external-dns-aws-credentials"
                  key  = "aws_access_key_id"
                }
                secretAccessKeySecretRef = {
                  name = "external-dns-aws-credentials"
                  key  = "aws_secret_access_key"
                }
              }
            }
            selector = {
              dnsZones = ["alialjaffer.com"]
            }
          }
        ]
      }
    }
  }
}
