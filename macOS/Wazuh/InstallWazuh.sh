#!/bin/bash
# This script will install Wazuh on macOS

# Detect the hardware architecture
ARCH=$(uname -m)

# Set the download URL based on the architecture
if [ "$ARCH" == "arm64" ]; then
    WAZUH_PKG_URL="https://packages.wazuh.com/4.x/macos/wazuh-agent-4.8.1-1.arm64.pkg"
elif [ "$ARCH" == "x86_64" ]; then
    WAZUH_PKG_URL="https://packages.wazuh.com/4.x/macos/wazuh-agent-4.8.1-1.intel64.pkg"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

echo "Installing Wazuh..."
# Download the Wazuh package
curl -so wazuh-agent-4.8.1.pkg $WAZUH_PKG_URL

# Set environment variables in a temporary file
echo "WAZUH_MANAGER='$WazuhManagerDNS'" > /tmp/wazuh_envs

# Run the installer, referencing the environment variables file
sudo bash -c 'source /tmp/wazuh_envs && installer -pkg ./wazuh-agent-4.8.1.pkg -target /'

# Clean up the temporary file
rm /tmp/wazuh_envs
