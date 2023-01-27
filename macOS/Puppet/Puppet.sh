echo "Making sure Homebrew is installed..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing Puppet Agent..."
brew install puppetlabs/puppet/puppet-agent --cask

