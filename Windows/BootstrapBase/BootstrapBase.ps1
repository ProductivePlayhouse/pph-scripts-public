# Run this script from an elevated PowerShell prompt
param(
    [string]$WazuhManagerDNS
)

# If $WazuhManagerDNS is not set, prompt the user for it
if (!$WazuhManagerDNS) {
	$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"
}

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallWazuh/InstallWazuh.ps1')) -WazuhManagerDNS $WazuhManagerDNS

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))
