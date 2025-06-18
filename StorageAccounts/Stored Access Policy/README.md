## Storage Access Policy

Access Policy's are container level access policies which can be associated to a SAS (via Storage Account Explorer). This policy allows us to set a granular role to the blob or container but then also allows us to expire them or delete them after the fact. With SAS, if we want to expire the SAS early or remove the SAS we have to rotate the 1 of the keys. This could have larger impact to any legacy apps that are using SAS or access keys as opposed to managed idenities. 

## How to create an access policy

We can create access policies by clicking on containers or on blobs and selecting "Access Policy". 


## Maximum of 5 access policies!!

## Maximum number of 2 Immutable policies