resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.resource_prefix}-aks-cluster"
  location            = var.rg_location
  resource_group_name = var.rg_name
  node_resource_group = var.node_rg
  dns_prefix          = "${var.resource_prefix}-dns"

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    node_count           = var.node_count_system_pool
    name                 = "${var.resource_prefix}np"
    vm_size              = var.vm_size_system_pool
    max_count            = var.max_count_system_pool
    min_count            = var.min_count_system_pool
    auto_scaling_enabled = true
    vnet_subnet_id       = var.cluster_subnet_id
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }


  network_profile {
    service_cidr   = var.aks_node_service_cidr
    dns_service_ip = var.aks_dns_service_ip
    network_plugin = var.network_plugin
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }


  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool" {
  name                        = "${var.resource_prefix}unp"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.aks.id
  vm_size                     = var.vm_size_user_pool
  vnet_subnet_id              = var.cluster_subnet_id
  node_count                  = var.node_count_user_pool
  auto_scaling_enabled        = true
  min_count                   = var.min_count_user_pool
  max_count                   = var.max_count_user_pool
  temporary_name_for_rotation = var.temporary_name_for_rotation
  upgrade_settings {
    drain_timeout_in_minutes      = 0
    max_surge                     = "10%"
    node_soak_duration_in_minutes = 0
  }
}
