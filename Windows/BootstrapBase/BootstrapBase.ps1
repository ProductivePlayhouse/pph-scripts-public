# Run this script from an elevated PowerShell prompt

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallWazuh/InstallWazuh.ps1'))

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))
