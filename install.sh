#!/usr/bin/env bash

# Import ANSI escape codes for colors
source _scripts/colours.sh

printf "$MAGENTA$BOLD%s$NC\n\n" "🏁 Beginning installation..."

source _scripts/install-homebrew.sh

source _scripts/install-from-brewfile.sh

source _scripts/install-rustup.sh

printf "$GREEN%s$NC\n" "✔ Installation complete!"
