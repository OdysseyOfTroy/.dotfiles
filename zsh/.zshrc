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

source $HOME/.config/nnn/.nnnrc.zsh

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

# zsh-syntax-highlighting.zsh must be sourced at the end of .zshrc
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
