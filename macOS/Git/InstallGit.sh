#!/bin/bash

if ! git --version >/dev/null 2>&1; then
    echo "Git is not installed"

    # Download the latest Git for macOS installer
    curl -o git-latest.pkg -L https://sourceforge.net/projects/git-osx-installer/files/latest/download

    # Install Git
    sudo installer -pkg git-latest.pkg -target /

    # Remove the installer file
    rm git-latest.pkg

    # Verify Git installation
    git --version

else
    echo "Git is already installed"
    exit 0
fi
