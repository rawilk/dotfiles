#!/bin/sh

echo "Setting up dev environment"
echo ""

# Configure NPM
echo "Configure NPM"
echo ""
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "$HOME/.npm-packages"
npm config set prefix "$HOME/.npm-packages"

# Puppeteer
# - Necessary for spatie browser shot package
npm install puppeteer --global

# Create dev directories and clone git repos
"$HOME/.dotfiles/clone.sh"

# Install Powerline Patched Fonts
"$HOME/.dotfiles/install-fonts.sh"

# Link our installed sites
"$HOME/.dotfiles/herd-links.sh"
