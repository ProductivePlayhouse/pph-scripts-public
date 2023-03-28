#!/bin/bash

# Set HOME variable if not set
if [ -z "$HOME" ]; then
  export HOME=$(eval echo "~$(whoami)")
fi

# Check if Homebrew is already installed
if ! command -v brew > /dev/null 2>&1; then
    echo "Installing Homebrew..."
    CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# Check if Homebrew is in the path
if [[ ! ":$PATH:" == *":/usr/local/bin:"* ]]; then
    echo "Adding Homebrew to path..."
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
    export PATH="/usr/local/bin:$PATH"
else
    echo "Homebrew already in path."
fi
