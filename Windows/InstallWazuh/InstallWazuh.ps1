# This script requires the DNS address of the Wazuh Manager as an argument
$WazuhManagerDNS = $args[0]

Write-Output "Installing Wazuh Agent..."
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.10-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.10.msi

Start-Process -FilePath msiexec.exe -ArgumentList '/qn', '/norestart', '/i', "$env:tmp\wazuh-agent-4.3.10.msi", "WAZUH_MANAGER=$WazuhManagerDNS", "WAZUH_REGISTRATION_SERVER=$WazuhManagerDNS", "WAZUH_AGENT_GROUP='default'" -Wait

Write-Output "Starting Wazuh Agent..."
NET START WazuhSvc