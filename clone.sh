#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/dev/code
PERSONAL=$CODE/personal
WORK=$CODE/work
PACKAGES=$CODE/packages
NPM=$CODE/npm
VENDOR=$CODE/vendor

# Personal
git clone git@github.com:rawilk/randallwilk.dev.git $PERSONAL/randallwilk.dev

# Work
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
