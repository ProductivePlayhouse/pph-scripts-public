# Run this script from an elevated PowerShell prompt

WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/BootstrapBase/BootstrapBase.ps1')) -WazuhManagerDNS $WazuhManagerDNS