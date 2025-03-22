#!/usr/bin/env bash

# Link dotfiles with stow
source _scripts/stow.sh

source _scripts/install-neovim-plugins.sh

printf "$GREEN$BOLD%s$Normal\n" "Configuration complete."
