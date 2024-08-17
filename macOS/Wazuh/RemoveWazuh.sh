#!/bin/bash
# This script will remove Wazuh from macOS

echo "Stopping Wazuh..."
sudo /Library/Ossec/bin/wazuh-control stop

echo "Removing Wazuh..."
sudo /bin/rm -r /Library/Ossec
sudo /bin/rm -f /Library/LaunchDaemons/com.wazuh.agent.plist
sudo /bin/rm -rf /Library/StartupItems/WAZUH
sudo /usr/bin/dscl . -delete "/Users/wazuh"
sudo /usr/bin/dscl . -delete "/Groups/wazuh"
sudo /usr/sbin/pkgutil --forget com.wazuh.pkg.wazuh-agent
