
output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "endpoint_subnet_id" {
  value = azurerm_subnet.endpoint_subnet.id
}

output "cluster_subnet_id" {
  value = azurerm_subnet.cluster_subnet.id
}
output "cluster_subnet_cidr" {
  value = azurerm_subnet.cluster_subnet.address_prefixes[0]
}

