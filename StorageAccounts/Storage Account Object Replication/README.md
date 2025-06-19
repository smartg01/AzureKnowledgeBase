# Storage Account Object replication

Storage Account Object Replication is a function in Azure Storage Account that replicates data from 1 storage account to another. 

## Use cases

Disaster recovery: Ensures data is available in another region if the primary region fails.
Data distribution: Makes data available closer to users or applications in different regions.
Compliance: Keeps copies of data in specific locations for regulatory reasons.
Backup: Provides an extra layer of protection by replicating data to a separate account.

## Settings that need to be enabled on the Storage Account

Change feed needs to be enable on the source Storage Account. 

Versioning needs to be enable on the Source & Destination Storage Account.