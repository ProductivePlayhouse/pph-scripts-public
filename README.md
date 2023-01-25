# pph-scripts-public

This repository is for Productive Playhouse scripts which can be made publicly available because they do not contain...
* Security information
* Trade secrets
* IP addresses
* Credentials

## Windows Bootstrap

Run the following to start Windows bootstrap:

```
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/Bootstrap/BootstrapBase.ps1'))
```
