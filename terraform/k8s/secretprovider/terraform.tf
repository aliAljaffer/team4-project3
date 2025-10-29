resource "kubernetes_manifest" "secret_provider_class" {
  manifest = {
    apiVersion = "secrets-store.csi.x-k8s.io/v1"
    kind       = "SecretProviderClass"
    metadata = {
      name      = "team4-super-secrets"
      namespace = var.app_ns
    }
    spec = {
      provider = "azure"
      parameters = {
        usePodIdentity       = "false"
        useVMManagedIdentity = "false"
        clientID             = var.app_client_id
        keyvaultName         = var.kv_name
        cloudName            = ""
        objects = join("\n", concat(
          ["array:"],
          [for secret_name, _ in var.secrets : "  - |\n    objectName: ${secret_name}\n    objectType: secret"]
        ))

        tenantId = data.azurerm_client_config.current.tenant_id
      }

      secretObjects = [
        {
          secretName = "catus-locatus-secrets"
          type       = "Opaque"
          data = [
            for secret_name, secret_k8s_key in var.secrets : {
              objectName = secret_name
              key        = secret_k8s_key
            }
          ]
        }
      ]
    }
  }
}
