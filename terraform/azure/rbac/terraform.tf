resource "azurerm_role_assignment" "k8s_acr_pull_oid" {
  principal_id                     = var.kubelet_object_id
  role_definition_name             = "AcrPull"
  scope                            = var.cr_id
  skip_service_principal_aad_check = true
}
resource "azurerm_role_assignment" "k8s_acr_pull_pid" {
  principal_id                     = var.kubelet_principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.cr_id
  skip_service_principal_aad_check = true
}

resource "azurerm_user_assigned_identity" "catus_locatus_identity" {
  name                = "cl-identity"
  resource_group_name = var.rg_name
  location            = var.rg_location
}

resource "azurerm_federated_identity_credential" "catus_locatus_fc" {
  name                = "cl-fc"
  resource_group_name = var.rg_name
  parent_id           = azurerm_user_assigned_identity.catus_locatus_identity.id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.aks_oidc_issuer_url
  subject             = "system:serviceaccount:${var.k8s_namespace}:${var.k8s_service_account}"
}

resource "azurerm_role_assignment" "aks_network_vnet" {
  scope                = var.main_vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.kubelet_principal_id
}

resource "azurerm_role_assignment" "kubelet_network_vnet" {
  scope                = var.main_vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.kubelet_object_id
}
