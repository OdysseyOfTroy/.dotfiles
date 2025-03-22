#!/usr/bin/env bash

printf "$CYAN$BOLD%s$NORMAL \n" " Installing vim plugins"
LAZY_CONFIG="$HOME/.dotfiles/neovim/.config/nvim/lua/odysseyoftroy/lazy.lua"

nvim -u "$LAZY_CONFIG" --headless "+Lazy! sync" +qa
