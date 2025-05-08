# Path to your dotfiles
export DOTFILES="$HOME/.dotfiles"

ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"

# Path to your custom zsh folder
ZSH_CUSTOM="$DOTFILES/shell"

# Hide username in prompt
DEFAULT_USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git composer macos)

source "$ZSH/oh-my-zsh.sh"

# Load the shell dotfiles, and then some:
# *~/.extra can be used for other settings you don't want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

# Maintain a list of visited directories for easier access in the terminal.
. $HOME/.dotfiles/shell/z.sh

# Alias hub to git
eval "$(hub alias -s)"


# Herd injected NVM configuration
export NVM_DIR="/Users/randall/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"