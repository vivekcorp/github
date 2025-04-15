terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
}

provider "azurerm" {
  features {
  }
subscription_id = "66b3f5b6-8e0e-40da-bb11-2e607df4cf26"
}
