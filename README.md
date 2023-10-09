# pph-scripts-public
This repository is for Productive Playhouse scripts which can be made publicly available because they do not contain...

* Security information
* Trade secrets
* IP addresses
* Credentials

# Windows Bootstrap
To start base Windows bootstrap via PowerShell:

```
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/Bootstrap/BootstrapBase.ps1'))
```

# macOS Bootstrap
To start base macOS bootstrap via terminal:

```
curl -o script.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Bootstrap/BootstrapBase.sh && chmod +x script.sh && bash ./script.sh
```

For the dev system version:

```
curl -o script.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Bootstrap/BootstrapDev.sh && chmod +x script.sh && sudo bash ./script.sh
```
