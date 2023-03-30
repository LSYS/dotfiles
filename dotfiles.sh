#!/bin/bash

                 echo " asd"
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
echo "Example: install <dotfile> <path_to_install_to>"
echo
echo "--------------------------------------------" 


install() {
    local dotfile="$1"
    local installpath="$INSTALL_PATH"

    if [ "$#" -eq 2 ]; then
        installpath="$2"
    fi

    if [ ! -d "$installpath" ]; then
        echo "Install path '$installpath' does not exist. Aborting."
        return 1
    fi

    SRC="$DOTFILES_MASTER/$dotfile"
    if [ -e "$SRC-$HOSTNAME" ]; then
        SRC="$SRC-$HOSTNAME"
    fi

    if [ -f "$dotfile" ]; then
        echo "Installing $dotfile to $installpath/$(basename "
            $dotfile")"
        ln -sfv "$SRC" "$installpath/$(basename "$SRC")"
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
# ${dotfile//$'\r'} removes any carriage return characters that may be present in the input file. 
# This can happen if the input file was created on a Windows system or if it was edited with certain 
# text editors.
#
# -r: read the last line of the file even if it does not end with a newline character
while read -r dotfile 
do
	dotfile="${dotfile//$'\r'}"
	install "$dotfile"
done < .dotfiles