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
  }

  identity {
    type = "SystemAssigned"
  }
}
