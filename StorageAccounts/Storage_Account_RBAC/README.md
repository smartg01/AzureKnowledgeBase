# Storage Account RBAC

Below are the built in roles for Storage Account RBAC

| Role Name | Role Description |
|-----------|------------------|
| Storage Account reader       | Provides read only control plan access   |
| Storage Account Contributor  | Provides contributor control plan access |
| Storage Account Owner        | Provides read Owner control plan access  |
| Storage Blob Data Reader     | Provides reader access to the control plane and data plane access |
| Storage Blob Data Contributor| Read, write, and delete Azure Storage containers and blobs.       |
| Storage Blob Data Owner      |Provides full access to Azure Storage blob containers and data, including assigning POSIX access control. |
| Storage File Data Privileged Contributor| Allows for read, write, delete, and modify ACLs on files/directories in Azure file shares by overriding existing ACLs/NTFS permissions. |
| Storage File Data Privileged Reader | Allows for read access on files/directories in Azure file shares by overriding existing ACLs/NTFS permissions. |

RBAC can only be assigned at the Storage Account / Container level / File Share level.


## Access control lists for Data lake gen 2

RBAC provides coarse-grained access control at the storage account, container, or blob level, **while ACLs offer fine-grained control at the directory and file level**

ACLs are based on providing users with Read access (R, Can read the contents of a file), Write Access (W, Can write or append to a file) or Execute (X).
