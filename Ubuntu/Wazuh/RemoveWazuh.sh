#!/bin/bash
# This script will remove Wazuh from Ubuntu

echo "Removing Wazuh agent..."
sudo apt-get remove -y wazuh-agent
sudo apt-get remove --purge -y wazuh-agent
sudo systemctl disable wazuh-agent
sudo systemctl daemon-reload