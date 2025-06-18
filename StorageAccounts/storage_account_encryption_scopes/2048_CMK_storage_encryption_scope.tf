

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

## AKV required to store encryption keys

resource "random_string" "akv_name" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = false
}

resource azurerm_key_vault "encryption_scope" {
  name = "kv-${random_string.akv_name.result}"
  location            = azurerm_resource_group.encryption_scope.location
  resource_group_name = azurerm_resource_group.encryption_scope.name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = true

}

# System assigned identity for the storage account must be granted access to the Key Vault.
# This is assigned on line 17.

resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id = azurerm_key_vault.encryption_scope.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.encryption_scope.identity[0].principal_id

  secret_permissions = ["Get"]
  key_permissions = [
    "Get",
    "UnwrapKey",
    "WrapKey"
  ]
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.encryption_scope.id
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


resource "azurerm_key_vault_key" "encryption_scope" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.encryption_scope.id
  key_type     = "RSA"
  key_size     = 2048 # 2048, 3072 and .
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]

  depends_on = [
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.storage
  ]
}


# This is customer managed key encryption scope

resource "azurerm_storage_encryption_scope" "encryption_scope1" {
  name               = "akvmanaged"
  storage_account_id = azurerm_storage_account.encryption_scope.id
  source             = "Microsoft.KeyVault"
  key_vault_key_id   = azurerm_key_vault_key.encryption_scope.id
  infrastructure_encryption_required = true
}
## This is for the 4096 key size




resource "azurerm_storage_container" "encryption_scope1" {
  name                  = "vhds1"
  storage_account_id    = azurerm_storage_account.encryption_scope.id
  container_access_type = "private"
  default_encryption_scope = azurerm_storage_encryption_scope.encryption_scope1.name
}

