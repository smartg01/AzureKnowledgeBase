# AzCopy

AzCopy is a command utiliiy tool that moves data around within Storage Accounts. AzCopy can be used to copy your data to, from, or between Azure storage accounts. Common use cases include:

* Copying data from an on-premises source to an Azure storage account
* Copying data from an Azure storage account to an on-premises source
* Copying data from one storage account to another storage account

Example code:

```bash
azcopy copy "https://garethsbxstoragev1.blob.core.windows.net/azcopy/download.png?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2025-06-14T14:27:40Z&st=2025-06-14T06:27:40Z&spr=https&sig=dZO9JsX2RkXj5eNItL3HnJUKRGB%2FvnGF5gVI4ilHgQk%3D" "https://garethsbxstoragev2.blob.core.windows.net/azcopydestination?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2025-06-14T14:28:33Z&st=2025-06-14T06:28:33Z&spr=https&sig=LSURm7uvrKt3OqkjkR62LBAndomdvr5%2BZETHCU7ryrg%3D"
```

When it comes to the 'azcopy copy' command, you can see a onprem destination or source to download / upload files. 

# Files bigger than 256mb

AzCopy doesn't automatically calculate and store the file's md5 hash code for a file greater than 256 MB.If you want AzCopy to do that, then append the --put-md5 flag to each copy command.


## AZCopy sync

Below command will sync files from the source and destination

```bash
azcopy sync 'C:\myDirectory' 'https://mystorageaccount.blob.core.windows.net/mycontainer' --recursive
```