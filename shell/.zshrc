# Path to your dotfiles
export DOTFILES="$HOME/.dotfiles"

ZSH_DISABLE_COMPFIX="true"

export ZSH="$HOME/.zshrc"

# Path to your custom zsh folder
ZSH_CUSTOM="$DOTFILES/shell"

# Hide username in prompt
DEFAULT_USER=`whoami`

# Load the shell dotfiles, and then some:
# *~/.extra can be used for other settings you don't want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

# Herd injected NVM configuration
export NVM_DIR="/Users/randall/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
export PATH="/Users/randall/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/randall/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/randall/Library/Application Support/Herd/config/php/83/"
