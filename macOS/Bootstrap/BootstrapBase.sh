if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

sudo curl -o xcode.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/XCode/InstallXCode.sh
sudo chmod +x xcode.sh
sudo bash ./xcode.sh

sudo curl -o git.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Git/InstallGit.sh
sudo chmod +x git.sh
sudo bash ./git.sh

if [ ! -e "/Library/Ossec/etc/ossec.conf" ]; then
    echo "Wazuh installation not found"
    sudo curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh
    sudo chmod +x wazuh.sh
    sudo bash ./wazuh.sh $WazuhManagerDNS
fi
