#!/bin/sh

# Create our code directories
echo 'Creating development directories...'
echo '-----------------------------------'
mkdir $HOME/dev
mkdir $HOME/dev/code
mkdir $HOME/dev/code/personal
mkdir $HOME/dev/code/work
mkdir $HOME/dev/code/packages
mkdir $HOME/dev/code/npm
mkdir $HOME/dev/code/vendor

echo 'Cloning repositories...'
echo '-----------------------'

CODE=$HOME/dev/code
PERSONAL=$CODE/personal
WORK=$CODE/work
NPM=$CODE/npm
PACKAGES=$CODE/packages
VENDOR=$CODE/vendor

# Personal
git clone git@github.com:rawilk/randallwilk.dev.git $PERSONAL/randallwilk.dev

# Work
git clone git@github.com:cybrix-solutions/cybrixsolutions.com.git $WORK/cybrixsolutions.com
git clone git@github.com:cybrix-solutions/rite.git $WORK/rite
git clone git@github.com:cybrix-solutions/rite-v3.git $WORK/rite-v3

# Packages
git clone git@github.com:rawilk/laravel-printing.git $PACKAGES/laravel-printing
git clone git@github.com:rawilk/laravel-app-key-rotator.git $PACKAGES/laravel-app-key-rotator
git clone git@github.com:rawilk/laravel-settings.git $PACKAGES/laravel-settings
git clone git@github.com:rawilk/laravel-breadcrumbs.git $PACKAGES/laravel-breadcrumbs
git clone git@github.com:rawilk/laravel-ups.git $PACKAGES/laravel-ups
git clone git@github.com:rawilk/laravel-casters.git $PACKAGES/laravel-casters
git clone git@github.com:rawilk/laravel-form-components.git $PACAKGES/laravel-form-components
git clone git@github.com:rawilk/package-skeleton-laravel.git $PACKAGES/package-skeleton-laravel

# NPM Packages
git clone git@github.com:rawilk/vue-context.git $NPM/vue-context

# Vendor Repos
git clone git@github.com:envault/envault.git $VENDOR/envault
git clone git@github.com:livewire/surge.git $VENDOR/surge
git clone git@github.com:spatie/laravel-backup-server $VENDORE/laravel-backup-server
