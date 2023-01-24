$WazuhManagerDNS = Read-Host "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com"

Write-Output "Installing Wazuh Agent..."
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.10.msi /q WAZUH_MANAGER=$WazuhManagerDNS WAZUH_REGISTRATION_SERVER=$WazuhManagerDNS WAZUH_AGENT_GROUP='default' 

Write-Output "Starting Wazuh Agent..."
NET START WazuhSvc