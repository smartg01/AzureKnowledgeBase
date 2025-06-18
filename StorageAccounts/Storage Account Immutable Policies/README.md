# Storage Account Immutable policies

Store business-critical blob data with immutable storage in a write once, read many (WORM) state with Immutable policies.

## Policy types

Legal hold - this is set period of time that you have legal tags assigned to the container.

Time based hold - With a time-based retention policy, users can set policies to store data for a specified interval. When a time-based retention policy is set, objects can be created and read, but not modified or deleted. After the retention period has expired, objects can be deleted but not overwritten.

## Appending blobs

"append" means to add new data to the end of an existing file or blob, without modifying or deleting the existing content.


```text

2025-06-18 10:00:00 - Service started
2025-06-18 10:05:00 - User logged in

```

Newly appended data

```text
2025-06-18 10:00:00 - Service started
2025-06-18 10:05:00 - User logged in
2025-06-18 10:10:00 - Data processed
```

## Maximum policies is 2!