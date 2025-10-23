resource "azurerm_network_security_group" "db_nsg" {
  name                = "${var.resource_prefix}-db-nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name
  security_rule {
    access                     = "Allow"
    name                       = "allow-mssql"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    priority                   = 100
    source_port_range          = "*"
    source_address_prefix      = var.cluster_subnet_cidr
    destination_address_prefix = var.main_vnet_address_space
    destination_port_range     = "1443"
  }
}
# resource "azurerm_subnet_network_security_group_association" "db_assoc" {
#   network_security_group_id = azurerm_network_security_group.db_nsg.id
#   subnet_id                 = var.db_subnet_id
# }
