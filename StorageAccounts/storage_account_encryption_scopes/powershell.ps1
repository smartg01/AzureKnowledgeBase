New-AzResourceGroup -Name "myResourceGroup" -Location "East US"
New-AzStorageAccount -Name "pwshrandomg3n" -ResourceGroupName "myResourceGroup" -Location "East US" -SkuName "Standard_LRS"
New-AzStorageEncryptionScope -StorageAccountName "pwshrandomg3n" -ResourceGroupName "myResourceGroup" -Name "myencryptionScope" -StorageEncryption
