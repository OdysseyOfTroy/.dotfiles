#!/usr/bin/env bash

# Import ANSI escape codes for colours
source _scripts/colours.sh

printf "$MAGENTA$BOLD%s$NORMAL\n" "🛠  Beginning tool configuration..."

# Link dotfiles with stow
source _scripts/stow.sh

source _scripts/install-neovim-plugins.sh

printf "$GREEN$BOLD%s$NORMAL\n" "Configuration complete."
