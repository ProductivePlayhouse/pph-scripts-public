Write-Output "Stopping Wazuh Agent..."
NET STOP WazuhSvc

Write-Output "Uninstall Wazuh Agent..."
msiexec.exe /x wazuh-agent-4.3.10-1.msi /qn 

Write-Output "Remove Wazuh directory..."
Remove-Item -Recurse -Force "C:\Program Files (x86)\ossec-agent\"