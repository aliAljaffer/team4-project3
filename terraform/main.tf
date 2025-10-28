# =-=-=-=---=-=--=-=-=-=-=-=-=-= AZURE
module "az_rg" {
  source          = "./azure/resourcegroup"
  location        = var.location
  resource_prefix = var.resource_prefix
}

module "az_vnet" {
  source          = "./azure/vnet"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.az_rg.rg_name
}
module "az_subnet" {
  source          = "./azure/subnet"
  vnet_name       = module.az_vnet.vnet_name
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.az_rg.rg_name
}
module "az_nsg" {
  source                  = "./azure/nsg"
  rg_location             = var.location
  resource_prefix         = var.resource_prefix
  rg_name                 = module.az_rg.rg_name
  db_subnet_id            = module.az_subnet.db_subnet_id
  cluster_subnet_id       = module.az_subnet.cluster_subnet_id
  main_vnet_address_space = module.az_vnet.vnet_address_space
  cluster_subnet_cidr     = module.az_subnet.cluster_subnet_cidr
}

module "az_kv" {
  source                    = "./azure/keyvault"
  rg_location               = var.location
  resource_prefix           = var.resource_prefix
  rg_name                   = module.az_rg.rg_name
  main_vnet_id              = module.az_vnet.vnet_id
  subnet_ids                = [module.az_subnet.cluster_subnet_id]
  pe_subnet_id              = module.az_subnet.endpoint_subnet_id
  author                    = var.author_name
  db_host                   = module.az_db.psql_server_fqdn
  db_name                   = module.az_db.psql_database_name
  db_password               = module.az_db.administrator_login_password
  db_server                 = module.az_db.psql_server_name
  db_user                   = module.az_db.administrator_login
  azure_storage_acc_key     = module.az_storage.storage_account_key
  azure_storage_acc_name    = module.az_storage.storage_account_name
  azure_storage_conn_string = module.az_storage.storage_account_conn_string
  azure_storage_container   = module.az_storage.container_name
  acr_login                 = module.az_acr.cr_link
  app_principal_id          = module.az_rbac.app_principal_id

}
module "az_db" {
  source              = "./azure/db"
  rg_location         = var.location
  resource_prefix     = var.resource_prefix
  rg_name             = module.az_rg.rg_name
  vnet_id             = module.az_vnet.vnet_id
  psql_admin_password = var.psql_admin_password
  psql_admin_username = var.psql_admin_username
  vnet_address_space  = toset([module.az_vnet.vnet_address_space])
  db_subnet_id        = module.az_subnet.db_subnet_id
}
module "az_aks" {
  source              = "./azure/aks"
  rg_location         = var.location
  resource_prefix     = var.resource_prefix
  rg_name             = module.az_rg.rg_name
  node_rg             = var.node_rg
  cluster_subnet_cidr = module.az_subnet.cluster_subnet_cidr
  cluster_subnet_id   = module.az_subnet.cluster_subnet_id
}

module "az_acr" {
  source            = "./azure/acr"
  rg_location       = var.location
  resource_prefix   = var.resource_prefix
  rg_name           = module.az_rg.rg_name
  acr_registry_name = var.acr_registry_name
  acr_registry_sku  = var.acr_registry_sku
  author            = var.author_name
}

module "az_rbac" {
  source               = "./azure/rbac"
  cr_id                = module.az_acr.cr_id
  kubelet_object_id    = module.az_aks.kubelet_object_id
  kubelet_principal_id = module.az_aks.kubelet_principal_id
  rg_location          = module.az_rg.rg_location
  aks_oidc_issuer_url  = module.az_aks.aks_oidc_issuer_url
  rg_name              = module.az_rg.rg_name
  k8s_namespace        = module.k8s_ns.app_ns
  k8s_service_account  = module.k8s_rbac.app_service_account_name
  main_vnet_id         = module.az_vnet.vnet_id
  kv_id                = module.az_kv.kv_id
}

module "az_storage" {
  source          = "./azure/storage"
  rg_location     = var.location
  resource_prefix = var.resource_prefix
  rg_name         = module.az_rg.rg_name
}


# =-=-=-=---=-=--=-=-=-=-=-=-=-= K8s

module "deployment" {
  source                         = "./k8s/deployment"
  az_aks_name                    = module.az_aks.aks_name
  ext_dns_sa_name                = module.k8s_rbac.ext_dns_service_account_name
  external_dns_access_key_id     = module.aws_iam.external_dns_access_key_id
  external_dns_access_key_secret = module.aws_iam.external_dns_secret_access_key
  depends_on                     = [module.aws_iam]
  ext_dns_secret_ref             = module.k8s_secret.ext_dns_secret_ref
}

module "k8s_ns" {
  source        = "./k8s/ns"
  depends_on    = [module.az_aks]
  app_namespace = var.app_namespace
}
module "k8s_helm" {
  source     = "./k8s/helm"
  depends_on = [module.az_aks, module.k8s_ns.ingress_object]
}
module "k8s_secret" {
  source                    = "./k8s/secret"
  k8s_ns                    = module.k8s_ns.app_ns
  aws_iam_access_key_id     = module.aws_iam.external_dns_access_key_id
  aws_iam_access_key_secret = module.aws_iam.external_dns_secret_access_key
  depends_on                = [module.az_aks]
}

module "k8s_rbac" {
  source         = "./k8s/rbac"
  app_client_id  = module.az_rbac.app_client_id
  app_ns         = module.k8s_ns.app_ns
  sa_name        = var.service_account_name
  depends_on     = [module.az_aks, module.aws_r53]
  hosted_zone_id = module.aws_r53.aws_r53_zone_id
}

module "k8s_secretprovider" {
  source        = "./k8s/secretprovider"
  app_id        = module.az_rbac.app_principal_id
  app_ns        = module.k8s_ns.app_ns
  kv_name       = module.az_kv.kv_name
  secrets       = module.az_kv.secret_to_key
  depends_on    = [module.az_aks, module.az_kv, module.az_rbac]
  app_client_id = module.az_rbac.app_client_id
}

# =-=-=-=---=-=--=-=-=-=-=-=-=-= AWS

module "aws_iam" {
  source          = "./aws/iam"
  aws_r53_zone_id = module.aws_r53.aws_r53_zone_id
}

module "aws_r53" {
  source     = "./aws/route53"
  r53_domain = var.domain_to_use
}
