#!/bin/bash

# defaults
DOTFILES_MASTER="$HOME/dotfiles"

echo "==================" 
echo "Install wslconfig"
echo "=================" 
echo "Install .wslconfig to the system."
echo
echo "Usage: $0"
echo "       -p installation path (default: $HOME)"
echo
echo "Example: install [<path_to_install_to>]"
echo
echo "--------------------------------------------" 

install() {
    username=$(whoami.exe)
    local username
    username=$(echo "$username" | awk -F '\\' '{print $2}' | tr -d '\r')
    local installpath="/mnt/c/Users/$username/"
    echo "Username: $username"

    SRC="$DOTFILES_MASTER/win/.wslconfig"
    if [ -e "$SRC-$HOSTNAME" ]; then
        SRC="$SRC-$HOSTNAME"
    fi
    echo "Source file: $SRC"

    if [ -f "$SRC" ]; then
        echo "Installing $SRC to $installpath:"
        ln -sfv "$SRC" "$installpath/.wslconfig"
    else
        echo "Error: $SRC does not exist"
        return 1
    fi
}

install