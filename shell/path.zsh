# Add directories to the PATH and prevent adding the same directory multiple times upon shell reload.
add_to_path() {
    if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:$PATH"
    fi
}

# Load dotfiles binaries
add_to_path "$DOTFILES/bin"

# Herd Binaries
# add_to_path "$HOME/Library/Application Support/Herd/bin"

# Sudoless npm https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
add_to_path "$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Extra paths
add_to_path "/Applications/PhpStorm.app/Contents/MacOS"
add_to_path "/opt/homebrew/bin"
