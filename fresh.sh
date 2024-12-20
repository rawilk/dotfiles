#!/bin/bash

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch "$HOME/.hushlogin"

# Check for Oh My Zsh and install if we don"t have it
if test ! $(which omz); then
  echo "Install oh-my-zsh"
  echo ""

  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Add global gitignore
ln -s "$HOME/.dotfiles/shell/.global-gitignore" "$HOME/.global-gitignore"
git config --global core.excludesfile "$HOME/.global-gitignore"

# Symlink zsh preferences
rm -rf "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/shell/.zshrc" "$HOME/.zshrc"

# Symlink the Mackup config
ln -s "$HOME/.dotfiles/macos/.mackup.cfg" "$HOME/.mackup.cfg"

# Activate z
cd ~/.dotfiles/shell
chmod +x z.sh

# Check for Homebrew and install if we don"t have it
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
brew tap homebrew/bundle
brew bundle --file "$HOME/.dotfiles/Brewfile"

# Setup dev environment
"$HOME/.dotfiles/dev.sh"

# Copy our custom warp workflows
if [[ ! -d ~/.warp/workflows ]];
then
  mkdir -p ~/.warp/workflows
fi
cp -a "$HOME/.dotfiles/.warp/workflows/." ~/.warp/workflows/

echo "++++++++++++++++++++++++++++++"
echo "++++++++++++++++++++++++++++++"
echo "All done!"

echo "++++++++++++++++++++++++++++++"
echo "Some optional tidbits"

echo "1. Set some sensible os x defaults by running: $HOME/.dotfiles/macos/set-defaults.sh"
echo "2. Install software not available through Homebrew/App Store:"
echo "--- Showcode"
echo "--- Yubico Authenticator"
echo "--- YubiKey Manager"

echo "++++++++++++++++++++++++++++++"
echo "++++++++++++++++++++++++++++++"
