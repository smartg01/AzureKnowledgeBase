resource_group_name="rg-demo-1720700000"
storage_account_name="stgacct700000"
location="eastus"
sku="Standard_LRS"
encryption_scope_name="escope700000"

az group create --name $resource_group_name --location $location
az storage account create --name $storage_account_name --resource-group $resource_group_name --location $location --sku $sku
az storage account encryption-scope create --account-name $storage_account_name --name $encryption_scope_name --resource-group $resource_group_name --key-source Microsoft.Storage