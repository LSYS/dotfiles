#!/bin/bash

# defaults
DOTFILES_MASTER="$HOME/dotfiles"
INSTALL_PATH="$HOME"

echo "================" 
echo "Install dotfiles"
echo "================" 
echo "Install a dotfile to the system."
echo
echo "Usage: $0 install dotfile [-p installpath]"
echo "       -p installation path (default: $HOME)"
echo
echo "--------------------------------------------" 


install() {

	local dotfile="$1"
	local installpath=$INSTALL_PATH

    if [ "$#" -eq 2 ]; then
        installpath="$2"
    fi

    if [ ! -d "$installpath" ]; then
        echo "Install path '$installpath' does not exist. Aborting."
        return 1
    fi

	SRC=$DOTFILES_MASTER/$dotfile
	if [ -e "$SRC-$HOSTNAME" ]; then
    	SRC="$SRC-$HOSTNAME"
	fi

	if [ -f "$dotfile" ]; then
		echo "Installing $dotfile to $installpath/$(basename $dotfile)" 
		ln -sfv "$SRC" "$INSTALL_PATH/$(basename "$SRC")"
	else
        echo "Error: $dotfile does not exist"
		return 1
	fi
}

# this should fail:
# install nullfile

# ================
# Install dotfiles
# ================
install bash/.bash_aliases
install bash/.bash_profile
install bash/.functions
install bash/.inputrc
install bash/.exports
install git/.gitconfig


