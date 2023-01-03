#!/bin/sh

echo 'Setting up dev environment'
echo '--------------------------'
echo ''

# Imagick
echo 'Install imagick'
echo '---------------'
pecl install imagick

# Memcached
echo 'Install memcached'
echo '-----------------'
pecl install memcached

# Pcov
echo 'Install pcov'
echo '------------'
pecl install pcov

# Laravel global installer
echo 'Install Laravel global installer'
echo '--------------------------------'
composer global require laravel/installer

# Laravel Valet
echo 'Install Laravel Valet'
echo '---------------------'
composer global require laravel/valet
valet install

# Expose
echo 'Install Expose'
echo '--------------'
composer global require beyondcode/expose

# Porter
echo 'Install Porter'
echo '--------------'
composer global require anystack-sh/porter

# Configure NPM
echo 'Configure NPM'
echo '-------------'
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# Puppeteer
# - Necessary for spatie browser shot package
npm install puppeteer --global

# chokidar
# - Necessary for Porter to restart services when files change
npm install --global chokidar

# Create dev directories and clone git repos
$DOTFILES/clone.sh

# Install Powerline Patched Fonts
$DOTFILES/install-fonts.sh

# Start all services
brew services run --all

# Set root mysql password
mysqladmin -u root -p password

# Link our installed sites
$DOTFILES/valet-links.sh
