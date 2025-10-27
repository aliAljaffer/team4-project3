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
  cluster_subnet_cidr     = module.subnet.cluster_subnet_cidr
}

module "kv" {
  source                    = "./azure/keyvault"
  rg_location               = var.location
  resource_prefix           = var.resource_prefix
  rg_name                   = module.rg.rg_name
  main_vnet_id              = module.vnet.vnet_id
  subnet_ids                = [module.subnet.cluster_subnet_id]
  pe_subnet_id              = module.subnet.endpoint_subnet_id
  author                    = var.author_name
  db_host                   = module.db.psql_server_fqdn
  db_name                   = module.db.psql_database_name
  db_password               = module.db.administrator_login_password
  db_server                 = module.db.psql_server_name
  db_user                   = module.db.administrator_login
  azure_storage_acc_key     = module.storage.storage_account_key
  azure_storage_acc_name    = module.storage.storage_account_name
  azure_storage_conn_string = module.storage.storage_account_conn_string
  azure_storage_container   = module.storage.container_name
  acr_login                 = module.acr.cr_link
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
  source              = "./azure/aks"
  rg_location         = var.location
  resource_prefix     = var.resource_prefix
  rg_name             = module.rg.rg_name
  node_rg             = var.node_rg
  cluster_subnet_cidr = module.subnet.cluster_subnet_cidr
  cluster_subnet_id   = module.subnet.cluster_subnet_id
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

module "rbac" {
  source               = "./azure/rbac"
  cr_id                = module.acr.cr_id
  kubelet_object_id    = module.aks.kubelet_object_id
  kubelet_principal_id = module.aks.kubelet_principal_id
}

module "pip" {
  source          = "./azure/publicip"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
}

module "storage" {
  source          = "./azure/storage"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.rg.rg_name
}
