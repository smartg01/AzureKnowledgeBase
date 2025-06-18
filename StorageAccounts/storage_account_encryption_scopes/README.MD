# Encryption scopes

## Encryption scopes are used to manage encryption of data at the container level in Azure Storage.

Encryption in containers are encrypted regardless, the scopes are about the keys. If you do not create a storage account encryption scope then the Containers will share the same Key as the rest of the storage account. you can choose between an additional MSFT managed key (A different key to that of the storage Account) or a customer managed key. please note that a CMK requires a Azure Key Vault to store this.

## you can assign multiple encryption scopes to a storage account, allowing you to use different keys for different containers.

Doing this means each container has a different key, this would improve defense in depth.

## You cannot add an encryption scope to an existing Azure Storage container after it has been created. 

If you add an encryption scope to an existing container, IaC will try to destroy it. Cannot be done via portal.

## Key length supported for encryption scopes are 2048, 3072 and 4096 bits.

## Disabling Encryption scopes

you can disable the Encryption scopes by access Encryption on the main storage account page. Once this is disabled, you wont be able to access any of the files in the container until its re-activated.