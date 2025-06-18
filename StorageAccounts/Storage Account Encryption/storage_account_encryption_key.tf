# Storage Account encryption key
# This is used to encrypt the storage account using a customer managed key from Azure Key Vault.



data "azurerm_client_config" "current" {}

resource azurerm_resource_group "encryption_key" {
  name     = "garencryptstoragekey"
  location = "australiaeast"
}

resource "azurerm_storage_account" "encryption_key" {
  name                = "garencryptkeystoragev2"
  resource_group_name = azurerm_resource_group.encryption_key.name

  location                 = azurerm_resource_group.encryption_key.location
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

resource "random_string" "akv_name" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = false
}

resource "azurerm_key_vault" "encryption_key" {
  name                = "kv-${random_string.akv_name.result}"
  location            = azurerm_resource_group.encryption_key.location
  resource_group_name = azurerm_resource_group.encryption_key.name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = true

}


resource "azurerm_key_vault_access_policy" "encryption_key" {
  key_vault_id = azurerm_key_vault.encryption_key.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.encryption_key.identity[0].principal_id

  secret_permissions = ["Get"]
  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey"
  ]
}

resource "azurerm_key_vault_access_policy" "encryption_key2" {
  key_vault_id = azurerm_key_vault.encryption_key.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = ["Get"]
  key_permissions = [
    "Get",
    "Create",
    "Delete",
    "List",
    "Restore",
    "Recover",
    "UnwrapKey",
    "WrapKey",
    "Purge",
    "Encrypt",
    "Decrypt",
    "Sign",
    "Verify",
    "GetRotationPolicy",
    "SetRotationPolicy"
  ]
}


resource "azurerm_key_vault_key" "encryption_key" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.encryption_key.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]

  depends_on = [azurerm_key_vault_access_policy.client, azurerm_key_vault_access_policy.storage]

}



resource "azurerm_storage_account_customer_managed_key" "encryption_key" {
  storage_account_id = azurerm_storage_account.encryption_key.id
  key_vault_id       = azurerm_key_vault.encryption_key.id
  key_name           = azurerm_key_vault_key.encryption_key.name
}