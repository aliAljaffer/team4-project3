terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.47.0"
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

  features {

  }

  subscription_id = var.subscription_id
}
