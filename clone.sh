#!/bin/bash

# Create our code directories
echo "Creating development directories..."
echo ""

devDirectories=(
    "$HOME/dev"
    "$HOME/dev/code"
    "$HOME/dev/code/artisanpm"
    "$HOME/dev/code/clients"
    "$HOME/dev/code/clients/lifelinecpr"
    "$HOME/dev/code/npm"
    "$HOME/dev/code/packages"
    "$HOME/dev/code/personal"
    "$HOME/dev/code/vendor"
    "$HOME/dev/code/work"
)

for dir in "${devDirectories[@]}"; do
    mkdir -p "$dir"
    echo "Created directory: $dir"
done

echo "Cloning repositories..."
echo ""

CODE="$HOME/dev/code"
PERSONAL="$CODE/personal"
WORK="$CODE/work"
NPM="$CODE/npm"
PACKAGES="$CODE/packages"
CLIENTS="$CODE/clients"

# ArtisanPM
git clone git@github.com:ArtisanPM/artisanpm.git "$CODE/artisanpm/artisanpm"

# Personal
git clone git@github.com:rawilk/randallwilk.dev.git "$PERSONAL/randallwilk.dev"
git clone git@github.com:rawilk/skeleton-laravel.git "$PERSONAL/skeleton-laravel"

# Work
git clone git@github.com:cybrix-solutions/cybrixsolutions.com.git "$WORK/cybrixsolutions.com"
git clone git@github.com:cybrix-solutions/notices.merrillha.com "$WORK/notices.merrillha.com"
git clone git@github.com:cybrix-solutions/rite.git "$WORK/rite"

# Packages
git clone git@github.com:cybrix-solutions/easypost.git "$PACKAGES/cybrix-solutions/easypost"
git clone git@github.com:rawilk/filament-password-input.git "$PACKAGES/filament-password-input"
git clone git@github.com:rawilk/filament-quill.git "$PACKAGES/filament-quill"
git clone git@github.com:rawilk/human-keys.git "$PACKAGES/human-keys"
git clone git@github.com:rawilk/laravel-app-key-rotator.git "$PACKAGES/laravel-app-key-rotator"
git clone git@github.com:rawilk/laravel-casters.git "$PACKAGES/laravel-casters"
git clone git@github.com:rawilk/laravel-printing.git "$PACKAGES/laravel-printing"
git clone git@github.com:rawilk/laravel-settings.git "$PACKAGES/laravel-settings"
git clone git@github.com:rawilk/laravel-stubs.git "$PACKAGES/laravel-stubs"
git clone git@github.com:rawilk/laravel-ups.git "$PACKAGES/laravel-ups"
git clone git@github.com:rawilk/laravel-webauthn.git "$PACKAGES/laravel-webauthn"
git clone git@github.com:rawilk/package-skeleton-laravel.git "$PACKAGES/package-skeleton-laravel"
git clone git@github.com:rawilk/profile-filament-plugin.git "$PACKAGES/profile-filament-plugin"

# NPM Packages
git clone git@github.com:rawilk/alpine-ripple.git "$NPM/alpine-ripple"

# Client Repos
git clone git@github.com:lifelinecpr/newlife.git "$CLIENTS/lifelinecpr/portal.newlifecpr"

# Vendor repos - for reference
git clone git@github.com:filamentphp/filament.git "$CODE/vendor/filament"
