---
sitemap:
  lastmod: 2025-07-08 +0000
---

# Windows PowerShell

Last modified: 2025-07-08 +0000

## Format time

Use the following to create new file/folder with ISO format time:

```powershell
New-Item -ItemType File -Path "MY_FILE_$((Get-Date).ToString('yyyy-MM-ddTHH:mm:ss')).txt"
New-Item -ItemType Directory -Path "SOME_NAME_$((Get-Date).ToString('yyyy-MM-ddTHH:mm:ss'))"
```
