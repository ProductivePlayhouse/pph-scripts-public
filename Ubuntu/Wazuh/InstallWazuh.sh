#!/bin/bash
# This script will install Wazuh on Ubuntu

if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

echo "Adding Wazuh repository..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && sudo chmod 644 /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list > /dev/null
sudo apt-get update -y

echo "Deploying Wazuh agent..."
sudo WAZUH_MANAGER=$WazuhManagerDNS apt-get install -y wazuh-agent
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

echo "Set version to only upgrade manually..."
echo "wazuh-agent hold" | sudo dpkg --set-selections
