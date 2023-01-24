# Run this script from an elevated PowerShell prompt
# Call this script remotely with:
# Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/BootstrapBase/BootstrapBase.ps1'))

# This script requires the DNS address of the Wazuh Manager as an argument
$WazuhManagerDNS = $args[0]

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallWazuh/InstallWazuh.ps1')) -WazuhManagerDNS $WazuhManagerDNS

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))
