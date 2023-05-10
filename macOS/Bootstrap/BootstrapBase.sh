if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

# Install XCode
curl -o xcode.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/XCode/InstallXCode.sh && chmod +x xcode.sh && bash ./xcode.sh

# Install Git
curl -o git.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Git/InstallGit.sh && chmod +x git.sh && bash ./git.sh

# Install Wazuh
if [ ! -e "/Library/Ossec/etc/ossec.conf" ]; then
    echo "Wazuh installation not found"
    curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh && chmod +x wazuh.sh && bash ./wazuh.sh $WazuhManagerDNS
fi
