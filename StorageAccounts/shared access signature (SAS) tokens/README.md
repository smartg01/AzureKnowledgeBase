# Shared access signature (SAS) tokens

Shared access Signature are a way to provide fine grained access within a Storage Account for a set time from a set location (IPs). A shared access signature is a token that is appended to the URI for an Azure Storage resource.


# SAS expiration policies

SAS expiration policy is a governance feature that allows admins to input the maximum agreed time for an SAS. If an SAS token is generated for longer than the policy, and Azure Monitor is configured to do so, an alert will be sent. The users who are generating SAS tokens will be alerted during the creation that the expiry date is over the agreed timeline in the policy. 

There are built in Azure Policies which can be applied to a sub / management scope.

## SAS Parameters when creating an SAS

* Allowed Services (File, blob, table & que)

* Allowed Resource type (Service, Container, Object)

* Allowed permissions (Read, Write etc)

* Blob versioning permissions (Provides the ability to delete versions)

* Permissions for viewing, creating and filtering blob indexes.

* Expiry time

* The ability to access via 80 or 443 

* Allowed IPs


