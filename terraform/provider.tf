terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.47.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.18.0"
    }
  }

  backend "azurerm" {
    storage_account_name = ""
    container_name       = ""
    key                  = ""
    resource_group_name  = ""
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
}
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "helm" {
  kubernetes = {
    host                   = module.az_aks.k8s_host
    client_certificate     = base64decode(module.az_aks.k8s_client_certificate)
    client_key             = base64decode(module.az_aks.k8s_client_key)
    cluster_ca_certificate = base64decode(module.az_aks.k8s_cluster_ca_certificate)
  }
}
provider "kubernetes" {
  host                   = module.az_aks.k8s_host
  client_certificate     = base64decode(module.az_aks.k8s_client_certificate)
  client_key             = base64decode(module.az_aks.k8s_client_key)
  cluster_ca_certificate = base64decode(module.az_aks.k8s_cluster_ca_certificate)
}

