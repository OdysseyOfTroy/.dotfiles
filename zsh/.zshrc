# Load Brew binaries before native binaries
PATH="$(brew --prefix)/bin:$PATH"
# Keg-only formulae that I need to manually add to PATH:
PATH="$(brew --prefix fzf)/bin:$PATH"
PATH="$(brew --prefix curl)/bin:$PATH"
PATH="$(brew --prefix lua-language-server)/bin:$PATH"

# Add custom binaries
PATH="$HOME/.bin:$PATH"
export PATH="$HOME:$PATH"

export VISUAL="nvim"
export EDITOR="nvim"
export VIMRC_LOCATION="$HOME/.config/nvim/init.lua"
export ZSHRC_LOCATION="$HOME/.zshrc"
export ALIASES_LOCATION="$HOME/.aliases"
export DOTFILES_LOCATION="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/_homebrew/Brewfile"

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

# fnm
FNM_PATH="/Users/troy/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/troy/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# zsh-syntax-highlighting.zsh must be sourced at the end of .zshrc
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
