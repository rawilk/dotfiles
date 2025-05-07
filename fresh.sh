#!/bin/bash

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch "$HOME/.hushlogin"

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Check for Oh My Zsh and install if we don"t have it
if test ! $(which omz); then
  echo "Install oh-my-zsh"
  echo ""

  # Remove directory if exists
  if [[ -d ~/.oh-my-zsh ]]; then
    rm -rf ~/.oh-my-zsh
  fi

  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Add global gitignore
ln -s "$HOME/.dotfiles/shell/.global-gitignore" "$HOME/.global-gitignore"
git config --global core.excludesfile "$HOME/.global-gitignore"

# Symlink zsh preferences
rm -rf "$HOME/.zshrc"
ln -sw "$HOME/.dotfiles/shell/.zshrc" "$HOME/.zshrc"

# Activate z
cd ~/.dotfiles/shell
chmod +x z.sh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Install homebrew"
  echo ""

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle -- deprecated
brew bundle --file "$HOME/.dotfiles/Brewfile"

# Setup dev environment
"$HOME/.dotfiles/dev.sh"

# Ensure all warp themes are available
if [[ ! -d ~/.warp ]];
then
  mkdir -p ~/.warp
fi
cd ~/.warp
git clone https://github.com/warpdotdev/themes.git
cd $HOME

# Copy our custom warp workflows
if [[ ! -d ~/.warp/workflows ]];
then
  mkdir -p ~/.warp/workflows
fi
cp -a "$HOME/.dotfiles/.warp/workflows/." ~/.warp/workflows/

# Set macOS preferences - we will run this last because this will reload the shell.
echo "Installation complete. Now setting some macOS defaults..."
source "$HOME/.dotfiles/macos/set-defaults.sh"
