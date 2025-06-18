resource "azurerm_resource_group" "example" {
  name     = "immutable-policy-sa-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "immutablepolsa654"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "example" {
  name                  = "example"
  storage_account_id = azurerm_storage_account.example.id
  container_access_type = "private"
}

resource "azurerm_storage_container_immutability_policy" "example" {
  storage_container_resource_manager_id = azurerm_storage_container.example.resource_manager_id
  immutability_period_in_days           = 1
  protected_append_writes_all_enabled   = false
  protected_append_writes_enabled       = true
}