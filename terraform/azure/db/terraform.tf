resource "azurerm_private_dns_zone" "psql_pvz" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_main_vnet" {
  name                  = "${var.resource_prefix}-sql-private-dns-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.psql_pvz.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

resource "azurerm_postgresql_flexible_server" "main_server" {
  name                          = local.sql_server_name
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  version                       = "17"
  delegated_subnet_id           = var.db_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.psql_pvz.id
  public_network_access_enabled = false
  administrator_login           = var.psql_admin_username
  administrator_password        = var.psql_admin_password
  zone                          = "1"

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name = "B_Standard_B2s"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.sql_main_vnet]

  authentication {
    password_auth_enabled = true
  }
}


resource "azurerm_postgresql_flexible_server_configuration" "postgis" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.main_server.id
  value     = "POSTGIS"
}


resource "azurerm_postgresql_flexible_server_database" "psql_database" {
  name      = var.psql_database_name
  server_id = azurerm_postgresql_flexible_server.main_server.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
resource "azurerm_network_security_group" "sql_nsg" {
  name                = "${var.resource_prefix}-sql-nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "AllowPSQL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = one(var.vnet_address_space)
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sql_nsg_association" {
  network_security_group_id = azurerm_network_security_group.sql_nsg.id
  subnet_id                 = var.db_subnet_id
}
