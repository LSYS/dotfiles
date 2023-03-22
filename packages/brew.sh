#!/bin/bash

## Set up brew (linuxbrew)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# checks if Linuxbrew has been installed in the user's home directory
# If so, run the brew shellenv command to set up the necessary environment variables
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# Like before, but heck if linuxbrew has been installed in home/linuxbrew/.linuxbrew
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# If .bash_profile existsm append "eval \$($(brew --prefix)/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
# Like before, but for .profile.
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# Test it
brew install hello
echo "Linuxbrew (Brew) is successfully set up"
brew update

# Install oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh