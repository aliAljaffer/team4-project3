module "rg" {
  source          = "./azure/resourcegroup"
  location        = var.location
  resource_prefix = var.resource_prefix
}

module "vnet" {
  source          = "./azure/vnet"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
}
module "subnet" {
  source          = "./azure/subnet"
  vnet_name       = module.vnet.vnet_name
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
}
module "nsg" {
  source                  = "./azure/nsg"
  rg_location             = var.location
  resource_prefix         = var.resource_prefix
  rg_name                 = module.rg.rg_name
  db_subnet_id            = module.subnet.db_subnet_id
  cluster_subnet_id       = module.subnet.cluster_subnet_id
  main_vnet_address_space = module.vnet.vnet_address_space
  cluster_subnet_cidr     = one(toset(module.subnet.cluster_subnet_cidr))
}

module "kv" {
  source          = "./azure/keyvault"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
  main_vnet_id    = module.vnet.vnet_id
  subnet_ids      = [module.subnet.cluster_subnet_id]
  pe_subnet_id    = module.subnet.endpoint_subnet_id
  author          = var.author_name
}
module "db" {
  source              = "./azure/db"
  rg_location         = var.location
  resource_prefix     = var.resource_prefix
  rg_name             = module.rg.rg_name
  vnet_id             = module.vnet.vnet_id
  psql_admin_password = var.psql_admin_password
  psql_admin_username = var.psql_admin_username
  vnet_address_space  = toset([module.vnet.vnet_address_space])
  db_subnet_id        = module.subnet.db_subnet_id
}
module "aks" {
  source          = "./azure/aks"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
  node_rg         = "team4-nodes"
  vm_size         = "Standard_A2_v2"
}

module "acr" {
  source            = "./azure/acr"
  rg_location       = var.location
  resource_prefix   = var.resource_prefix
  rg_name           = module.rg.rg_name
  acr_registry_name = var.acr_registry_name
  acr_registry_sku  = var.acr_registry_sku
  author            = var.author_name
}
