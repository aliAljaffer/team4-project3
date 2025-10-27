resource "azurerm_subnet" "cluster_subnet" {
  name                 = "${var.resource_prefix}-cluster-subnet"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
  address_prefixes     = var.cluster_subnet_cidr # ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.KeyVault"]
}
resource "azurerm_subnet" "db_subnet" {
  name                              = "${var.resource_prefix}-db-subnet"
  virtual_network_name              = var.vnet_name
  resource_group_name               = var.rg_name
  address_prefixes                  = var.db_subnet_cidr
  private_endpoint_network_policies = "Enabled"
  service_endpoints                 = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }

}

resource "azurerm_subnet" "endpoint_subnet" {
  name                 = "${var.resource_prefix}-endpoint-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.endpoint_subnet_cidr # ["10.0.8.0/24"]
  service_endpoints    = ["Microsoft.KeyVault"]
}
