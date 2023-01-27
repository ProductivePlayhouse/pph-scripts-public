echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Wazuh
curl -o wazuh.sh https://raw.githubusercontent.com/ProductivePlayhouse/pph-scripts-public/main/macOS/Wazuh/InstallWazuh.sh && chmod +x wazuh.sh && bash ./wazuh.sh
