#!/bin/bash

########
# nvim #
########
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$HOME/dotfiles/nvim/after" "$HOME/.config/nvim/"
ln -sf "$HOME/dotfiles/nvim/LuaSnip" "$HOME/.config/nvim/"

#########
# sxhkd #
#########
ln -sf "$HOME/dotfiles/sxhkd" "$HOME/.config/"

#########
# bspwm #
#########
ln -sf "$HOME/dotfiles/bspwm" "$HOME/.config/"

###########
# polybar #
###########
ln -sf "$HOME/dotfiles/polybar" "$HOME/.config/"
