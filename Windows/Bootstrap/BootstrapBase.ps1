# Run this script from an elevated PowerShell prompt
param(
	[string]$WazuhManagerDNS
)

# If $WazuhManagerDNS is not set, prompt the user for it
if (!$WazuhManagerDNS) {
	$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"
}

$WazuhScriptPath = ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/Wazuh/InstallWazuh.ps1'))
Invoke-Command -ScriptBlock ([scriptblock]::Create($WazuhScriptPath)) -ArgumentList $WazuhManagerDNS

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/Chocolatey/InstallChocolatey.ps1'))

Write-Host "Reloading path..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Installing Chrome..."
choco install -y googlechrome
