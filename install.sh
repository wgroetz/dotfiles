#!/bin/bash

########
# nvim #
########
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$HOME/dotfiles/nvim/after" "$HOME/.config/nvim/after"
