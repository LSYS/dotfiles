#!/usr/bin/env bash

# ~/.bash_profile is the first thing that is read.
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#============================================================================
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
bashdotfiles=(
    bash_aliases
    exports
    functions
    )
for file in "${bashdotfiles[@]}"; do
    file=~/."$file"
    if [ -f "$file" ]; then
        source "$file"
    fi
done;
unset file;

# Load configs in inputrc
bind -f ~/.inputrc


#============================================================================
# Oh-My-Posh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh --init --shell bash --config ~/poshthemes/slim.omp.json)"


#============================================================================
clear
echo "Type 'ahelp' for quick help on my shell aliases"
