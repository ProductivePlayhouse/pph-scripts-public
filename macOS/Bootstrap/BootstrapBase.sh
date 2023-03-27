if [ -z "$1" ]; then
	# If no argument was provided, read DNS address from the user
	echo "Enter the DNS address of the Wazuh Manager, e.g. wazuh.com: "
	read WazuhManagerDNS
else
	# If an argument was provided, use it for DNS
	WazuhManagerDNS=$1
fi

echo "Installing git..."
curl -O https://github.com/git/git/archive/refs/tags/v2.31.1.tar.gz
tar -xf v2.31.1.tar.gz
cd git-2.31.1/
make configure
./configure --prefix=/usr/local/git
make all
sudo make install
echo 'export PATH="/usr/local/git/bin:$PATH"' >> ~/.bash_profile

cd ~
curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh && chmod +x wazuh.sh && bash ./wazuh.sh $WazuhManagerDNS
