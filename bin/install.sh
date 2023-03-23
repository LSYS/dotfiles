#!/bin/bash

# defaults
DOTFILES_MASTER="$HOME/dotfiles"
INSTALL_PATH="$HOME"

cd "$INSTALL_PATH" && ln -s "$DOTFILES_MASTER"/bin .
echo "Installed binaries to $HOME/bin"