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
git clone git@github.com:cybrix-solutions/rite.git $WORK/rite
git clone git@github.com/rawilk/rite-v3.git $WORK/rite-v3

# Packages
git clone git@github.com:rawilk/laravel-printing.git $PACKAGES/laravel-printing
git clone git@github.com:rawilk/shipper.git $PACKAGES/shipper
git clone git@github.com/rawilk/package-skeleton-laravel.git $PACKAGES/package-skeleton-laravel

# NPM Packages
git clone git@github.com:rawilk/vue-context.git $NPM/vue-context
git clone git@github.com:rawilk/vue-context-docs.git $NPM/vue-context-docs

# Vendor Repos
git clone git@github.com:envault/envault.git $VENDOR/envault
git clone git@github.com:livewire/surge.git $VENDOR/surge

