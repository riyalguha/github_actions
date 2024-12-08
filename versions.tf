# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {
  resource_group_name  = "rg-backend"  # The same resource group for your other resources
  storage_account_name = "statestorage2002"
  container_name       = "terraform-state"
  key                  = "terraform.tfstate"
}
}

# Provider Block
provider "azurerm" {
 features {}    
 subscription_id = "c969e594-464c-44e1-9216-95819d676fc8"       
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}