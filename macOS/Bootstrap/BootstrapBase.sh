if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

echo "Setting home variable..."
export HOME=$(echo ~)

# Check if Xcode command-line tools are already installed
if ! xcode-select -p &>/dev/null; then
    # Trigger the installation of Xcode command-line tools
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

    # Find the latest available version
    CLT_PACKAGE=$(softwareupdate -l | grep -B 1 -E "Command Line Tools" | awk -F"*" '/^ *\\*/ {print $2}' | sed -e 's/^ *//' | head -n1)

    # Install the latest available version
    softwareupdate -i "${CLT_PACKAGE}" --verbose

    # Remove the temporary file
    rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi

# Make sure the tools are available
if xcode-select -p &>/dev/null; then
    echo "Xcode command-line tools are installed and available."
else
    echo "Failed to install Xcode command-line tools."
    exit 1
fi

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to path..."
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

echo "Installing git..."
brew install git

curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh && chmod +x wazuh.sh && bash ./wazuh.sh $WazuhManagerDNS
