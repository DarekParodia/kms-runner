#!/bin/bash

# Check if NVM is installed
if [ -d "${HOME}/.nvm/.git" ]; then
    echo "NVM is already installed."
else
    echo "NVM is not installed. Installing NVM..."
    
    # Install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Installing Node.js using NVM..."
    
    # Install the latest LTS version of Node.js using NVM
    nvm install --lts
    
    echo "Node.js has been installed."
else
    echo "Node.js is already installed."
fi

npm install
node main.js