# Run this script from an elevated PowerShell prompt
$WazuhManagerDNS = $args[0]

# If $WazuhManagerDNS is not set, prompt the user for it
if (!$WazuhManagerDNS) {
	$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"
}

$params = @{
	'WazuhManagerDNS' = $WazuhManagerDNS
}
$WazuhScriptPath = ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallWazuh/InstallWazuh.ps1'))
Invoke-Command -ScriptBlock ([scriptblock]::Create($WazuhScriptPath)) -ArgumentList $params

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/Windows/InstallChocolatey/InstallChocolatey.ps1'))
