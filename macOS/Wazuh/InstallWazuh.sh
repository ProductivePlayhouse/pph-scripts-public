#!/bin/bash
# This script will install Wazuh on macOS

if [ -z "$1" ]; then
	# If no argument was provided, read one from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, then use it
	WazuhManagerDNS=$1
fi

echo "Installing Wazuh..."
curl -so wazuh-agent-4.3.10.pkg https://packages.wazuh.com/4.x/macos/wazuh-agent-4.3.10-1.pkg && sudo launchctl setenv WAZUH_MANAGER $WazuhManagerDNS && sudo installer -pkg ./wazuh-agent-4.3.10.pkg -target /