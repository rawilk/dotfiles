# Add directories to the PATH and prevent adding the same directory multiple times upon shell reload.
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Load dotfiles binaries
add_to_path "$DOTFILES/bin"

# Load global Composer tools
add_to_path "$HOME/.composer/vendor/bin"

# Load global Node installed binaries
add_to_path "$HOME/.node/bin"

# Sudoless npm https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
add_to_path "$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Extra paths
add_to_path "/usr/local/bin"
add_to_path "/usr/local/opt/imagemagick@7/bin"
add_to_path "/Applications/PhpStorm.app/Contents/MacOS"
add_to_path "/usr/local/sbin"
add_to_path "/opt/homebrew/bin"

# Use project specific binaries before global ones
add_to_path "vendor/bin"
add_to_path "node_modules/.bin"
