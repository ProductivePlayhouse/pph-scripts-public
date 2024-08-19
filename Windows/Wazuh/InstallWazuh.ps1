param(
	[string]$WazuhManagerDNS
)

# Define the Wazuh version as a variable
$WazuhVersion = "4.8.1"

if (!$WazuhManagerDNS) {
	$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"
}

Write-Output "Installing Wazuh Agent..."
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-$WazuhVersion-1.msi" -OutFile "${env:tmp}\wazuh-agent-$WazuhVersion.msi"

Start-Process -Wait -FilePath msiexec.exe -ArgumentList '/q', '/norestart', '/i', "$env:tmp\wazuh-agent-$WazuhVersion.msi", "WAZUH_MANAGER=$WazuhManagerDNS", "WAZUH_REGISTRATION_SERVER=$WazuhManagerDNS"

Write-Output "Making sure DNS is correct..."
$filePath = "C:\Program Files (x86)\ossec-agent\ossec.conf"
$xmlContent = Get-Content $filePath
$xmlContent = $xmlContent -replace "<address>0.0.0.0</address>", "<address>$WazuhManagerDNS</address>"
Set-Content -Value $xmlContent -Path $filePath

Write-Output "Starting Wazuh Agent..."
NET START WazuhSvc
