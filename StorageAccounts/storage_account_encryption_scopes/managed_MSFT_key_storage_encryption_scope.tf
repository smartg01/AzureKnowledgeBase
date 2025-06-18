data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "encryption_scope" {
  name     = "garencryptscope"
  location = "australiaeast"
}

resource "azurerm_storage_account" "encryption_scope" {
  name                = "garencryptstoragev2"
  resource_group_name = azurerm_resource_group.encryption_scope.name

  location                 = azurerm_resource_group.encryption_scope.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind            = "StorageV2"

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [ 
        customer_managed_key
    ]
  }
}

# This is Microsoft managed key encryption scope

resource "azurerm_storage_encryption_scope" "encryption_scope" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.encryption_scope.id
  source             = "Microsoft.Storage"
  infrastructure_encryption_required = true
}

resource "azurerm_storage_container" "encryption_scope" {
  name                  = "vhds"
  storage_account_id    = azurerm_storage_account.encryption_scope.id
  container_access_type = "private"
  default_encryption_scope = azurerm_storage_encryption_scope.encryption_scope.name
}

