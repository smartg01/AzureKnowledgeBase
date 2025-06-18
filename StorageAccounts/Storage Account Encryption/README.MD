# Storage Account encryption

Storage Account are encrypted as standard with AES-256. you can choose which keys you would like to use though, whether you would like to use CMK or PMK. 

## Double encryption

Customers who require high levels of assurance that their data is secure can also enable 256-bit AES encryption at the Azure Storage infrastructure level. When infrastructure encryption is enabled, data in a storage account is encrypted twice — once at the service level and once at the infrastructure level — with two different encryption algorithms and two different keys.

## Can it be amended from CMK to PMK

You can switch between customer-managed keys and Microsoft-managed keys at any time. For more information about Microsoft-managed keys

#### Please note that the storage account must have a system assigned identity enabled for this to work.