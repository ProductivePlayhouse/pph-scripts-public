#!/bin/bash
# This script will remove Wazuh from Amazon Linux 2

echo "Removing Wazuh agent..."
sudo yum remove -y wazuh-agent
sudo rm -rf /var/ossec
sudo systemctl disable wazuh-agent
sudo systemctl daemon-reload