#!/bin/bash

# defaults
DOTFILES_MASTER="$HOME/dotfiles"
INSTALL_PATH="$HOME"

cd $HOME && ln -s $DOTFILES_MASTER/bin .