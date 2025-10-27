resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.resource_prefix}-aks-cluster"
  location            = var.rg_location
  resource_group_name = var.rg_name
  node_resource_group = var.node_rg
  dns_prefix          = "${var.resource_prefix}-dns"
  default_node_pool {
    node_count           = var.node_count
    name                 = "${var.resource_prefix}np"
    vm_size              = var.vm_size
    max_count            = var.max_count
    min_count            = var.min_count
    auto_scaling_enabled = true
    vnet_subnet_id       = var.cluster_subnet_id
  }


  network_profile {
    service_cidr   = "10.2.0.0/16"
    dns_service_ip = "10.2.0.10"
    network_plugin = "azure"

  }


  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool" {
  name                        = "${var.resource_prefix}unp"
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.aks.id
  vm_size                     = var.vm_size
  vnet_subnet_id              = var.cluster_subnet_id
  node_count                  = 2
  auto_scaling_enabled        = true
  min_count                   = 2
  max_count                   = 3
  temporary_name_for_rotation = "team4tmpnm"
}
