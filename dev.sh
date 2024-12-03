#!/bin/sh

echo "Setting up dev environment"
echo ""

# Imagick
echo "Install imagick"
echo ""
pecl install imagick

# Laravel global installer
echo "Install Laravel global installer"
echo ""
composer global require laravel/installer

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
"$DOTFILES/clone.sh"

# Install Powerline Patched Fonts
"$DOTFILES/install-fonts.sh"

# Start all services
# I'm not sure I actually have any services that run through Homebrew anymore...
# brew services run --all

# Note: DB's are managed through Herd now.
# Set root mysql password
# mysqladmin -u root -p password

# Create postgres root user
# createuser --createdb root

# Link our installed sites
"$DOTFILES/herd-links.sh"
