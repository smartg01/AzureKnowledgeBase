resource "azurerm_resource_group" "example" {
  name     = "garethsbx-storage-rg"
  location = "australiaeast"
}

resource "azurerm_storage_account" "example" {
  name                = "garethsbxstoragev2"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind            = "StorageV2"

  blob_properties {
    last_access_time_enabled = true # This is required for lifecycle management rules to work
    versioning_enabled       = true # This is required for object replication to work
    change_feed_enabled = true # This is required for object replication to work
  }
  

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [ 
        customer_managed_key
    ]
  }
}

resource "azurerm_storage_account" "example1" {
  name                = "garethsbxblobstorage"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind            = "BlobStorage"
}

resource "azurerm_storage_account" "example2" {
  name                = "garethsbxblockstorage"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Premium"
  account_replication_type = "ZRS"
  account_kind            = "BlockBlobStorage"
}

resource "azurerm_storage_account" "example3" {
  name                = "garethsbxfilestorage"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind            = "FileStorage"
}

## Data Lake Storage Gen2

resource "azurerm_storage_account" "datalake" {
  name                = "garethsbxdatalake"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind            = "StorageV2"

  is_hns_enabled           = true
}