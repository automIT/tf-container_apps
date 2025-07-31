terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.5"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f4d51eb3-2c3b-4728-a0f4-2d06e1169485"
}