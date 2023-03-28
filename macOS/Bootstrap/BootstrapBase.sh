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

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to path..."
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

echo "Installing git..."
brew install git

# Install Wazuh
curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh && chmod +x wazuh.sh && bash ./wazuh.sh $WazuhManagerDNS
