resource "azurerm_role_assignment" "k8s_acr_pull" {
  principal_id                     = var.kubelet_object_id
  role_definition_name             = "AcrPull"
  scope                            = var.cr_id
  skip_service_principal_aad_check = true
}
