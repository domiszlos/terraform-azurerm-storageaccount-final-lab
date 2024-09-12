terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}


locals {
  tags = {
    "Environment" = var.environment
  }
}


resource "azurerm_storage_account" "storage" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  public_network_access_enabled = false

 
}