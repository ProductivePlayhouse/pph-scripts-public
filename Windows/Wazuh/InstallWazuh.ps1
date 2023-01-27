param(
	[string]$WazuhManagerDNS
)

if (!$WazuhManagerDNS) {
	$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"
}

Write-Output "Installing Wazuh Agent..."
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi

Start-Process -FilePath msiexec.exe -ArgumentList '/q', '/norestart', '/i', "$env:tmp\wazuh-agent-4.3.10.msi", "WAZUH_MANAGER=$WazuhManagerDNS", "WAZUH_REGISTRATION_SERVER=$WazuhManagerDNS", "WAZUH_AGENT_GROUP='default'" -Wait

Write-Output "Making sure DNS is correct..."
$filePath = "C:\Program Files (x86)\ossec-agent\ossec.conf"
$xmlContent = Get-Content $filePath
$xmlContent = $xmlContent -replace "<address>0.0.0.0</address>", "<address>$WazuhManagerDNS</address>"
Set-Content -Value $xmlContent -Path $filePath

Write-Output "Starting Wazuh Agent..."
NET START WazuhSvc