# Storage Account Redundency

Storage account has multiple layers of redundency. Please see below

LRS (Local redundant storage)
ZRS (Zone Redundant Storage)
GRS (Geo redunant storage)
RA-GRS (Read Access geo reduntant storage)
GRZS (Geo Zone redundant Storage)
RA-GZRS (Read Access geo zone reduntant storage)



| Redundency type | How many copies of data are stored | Description of the service |
|-|-|
| LRS             | 3 copies in 1 Azure DC               | This is local redundant storage, the cheapest version of redundency|
| ZRS             | 3 copies across 3 Azure DCs in 1 region | This is zone redundant storage | 
| GRS             | 6 copies across 2 Azure DCs in 2 regions | Geo Redundant storage. Provides HA and DR capability to applications. |
| GRZS | 6 copies across 6 DCs in 2 regions| This is the most expensive offering. Geo redundant zone storage. |
| RA-GRS | 6 copies across 6 DCs in 2 regions| RO-GRS is used when you want geo-redundancy with the ability to access your data in a secondary region in read-only mode.|
| RA-GZRS | 6 copies across 6 DCs in 2 regions | Combines zone and geo-redundancy with read access to the secondary region. |