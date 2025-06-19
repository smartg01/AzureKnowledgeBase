# Storage Account Networking

There are 3 options when it comes to networking for Storage Accounts. 

## Public Endpoint

Storage Accounts can be accessed via the Public internet using Public Endpoint. This impacts your defende in depth and only authentication is your only barrier to the Storage Account. 

## Public Endpoint with restricted network rules

Storage accounts has built in networking to stop users from accessing the Storage Account that are not from the set rules implemented. These rules are for selecting Virtual Networks and Subnets, as well as public IP addresses. 

## Private Endpoint

Storage Account can disable there public endpoint and then enabling a private endpoint for there solution.


## Microsoft network routing

Microsoft network routing keeps your data on Microsoft’s private network for better performance and security.
Internet routing sends your data over the public internet, which may be less secure and slower.