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

# Create dev directories and clone git repos
$DOTFILES/clone.sh

# Install Powerline Patched Fonts
$DOTFILES/install-fonts.sh

# Start all services
brew services run --all

# Set root mysql password
mysqladmin -u root -p password