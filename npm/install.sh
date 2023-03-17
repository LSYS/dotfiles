#!/bin/bash

# Install nvm
# NVM (Node Version Manager) is a command-line tool that allows you to easily switch 
# between different versions of Node.js on your machine. With NVM, you can install and 
# manage multiple versions of Node.js on the same machine, and easily switch between them as needed.
curl -o- nvm-installer.sh https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Reload the shell configuration
source ~/.bash_profile

# Verify that nvm was installed successfully
# should be "nvm"
if [[ -n $(command -v nvm) ]]; then
    echo "nvm was installed successfully"
else
    echo "nvm installation failed"
fi

# Install Node.js
nvm install 16.0.0

# List nvm versions
if nvm ls &> /dev/null; then
	nvm ls
    echo "nvm was installed successfully"
else
    echo "nvm installation failed"
fi

# Check version
if node --version &> /dev/null; then
  echo "NVM is installed"
else
  echo "NVM is not installed"
  echo "Failed command: node --version"
  exit 1
fi


#------------------------------------------
# Install node packages
#------------------------------------------
echo "==> Installing reveal.js and reveal-md"
npm install --global reveal.js reveal-md

echo "==> Installing tldr"
npm install --global tldr

echo "==> Installing http-server and live-server"
npm install --global http-server live-server
