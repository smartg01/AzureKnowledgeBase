# Storage Account Soft Delete and Snapshots (Including Azure files)

## Soft delete for azure file share.

Soft delete is enabled by default on file share for 7 days. For Azure File Share, soft delete is at the directory level. This can be set between 1 day OR 365 days. You can also disable it.

![alt text](<Screenshot from 2025-06-19 16-13-33.png>)

## Soft Delete for Azure blob

Soft delete for blobs needs to be turned on during creation but can be amended after the fact. You can turn on soft delete at a container (Folder) or blob (File) level.

![alt text](<Screenshot from 2025-06-19 16-10-39.png>)

## Snapshots

Snapshots can be taken off Azure file Directories and Azure blobs (but not containers). These are good for point in time restores.