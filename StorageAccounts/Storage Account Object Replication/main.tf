resource "azurerm_resource_group" "example" {
  name     = "garethsbx-storage-rg"
  location = "australiaeast"
}

resource "azurerm_storage_account" "source" {
  name                = "garethsrcstoragev2"
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

resource "azurerm_storage_container" "source" {
  name                  = "srcstrcontainer"
  storage_account_id  = azurerm_storage_account.source.id
  container_access_type = "private"
}

resource "azurerm_storage_account" "destination" {
  name                = "garethdststoragev2"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind            = "StorageV2"

  blob_properties {
    last_access_time_enabled = true # This is required for lifecycle management rules to work
    versioning_enabled       = true # This is required for object replication to work
    change_feed_enabled = false # This is required for object replication to work
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

resource "azurerm_storage_container" "destination" {
  name                  = "dststrcontainer"
  storage_account_id  = azurerm_storage_account.destination.id
  container_access_type = "private"
}


resource "azurerm_storage_object_replication" "example" {
  source_storage_account_id      = azurerm_storage_account.source.id
  destination_storage_account_id = azurerm_storage_account.destination.id
  rules {
    source_container_name      = azurerm_storage_container.source.name
    destination_container_name = azurerm_storage_container.destination.name
  }
}