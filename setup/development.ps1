# -------------------------------------------------------------------------------------
# Create development directories
# -------------------------------------------------------------------------------------

Write-Host "`n📁 Creating development directories..."

$devDirectories = @(
    "$HOME\dev",
    "$HOME\dev\code",
    "$HOME\dev\code\artisanpm",
    "$HOME\dev\code\clients",
    "$HOME\dev\code\clients\lifelinecpr",
    "$HOME\dev\code\npm",
    "$HOME\dev\code\packages",
    "$HOME\dev\code\personal",
    "$HOME\dev\code\vendor",
    "$HOME\dev\code\work"
)

foreach ($dir in $devDirectories) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    Write-Host "✔️ Created: $dir"
}

# -------------------------------------------------------------------------------------
# Clone repositories
# -------------------------------------------------------------------------------------

$CODE = "$HOME\dev\code"
$PERSONAL = "$CODE\personal"
$WORK = "$CODE\work"
$NPM = "$CODE\npm"
$PACKAGES = "$CODE\packages"
$CLIENTS = "$CODE\clients"

git clone git@github.com:ArtisanPM/artisanpm.git "$CODE\artisanpm\artisanpm"

git clone git@github.com:rawilk/randallwilk.dev.git "$PERSONAL\randallwilk.dev"
git clone git@github.com:rawilk/skeleton-laravel.git "$PERSONAL\skeleton-laravel"

git clone git@github.com:cybrix-solutions/cybrixsolutions.com.git "$WORK\cybrixsolutions.com"
git clone git@github.com:cybrix-solutions/notices.merrillha.com "$WORK\notices.merrillha.com"
git clone git@github.com:cybrix-solutions/rite.git "$WORK\rite"

git clone git@github.com:cybrix-solutions/easypost.git "$PACKAGES\cybrix-solutions\easypost"
git clone git@github.com:rawilk/filament-password-input.git "$PACKAGES\filament-password-input"
git clone git@github.com:rawilk/filament-quill.git "$PACKAGES\filament-quill"
git clone git@github.com:rawilk/human-keys.git "$PACKAGES\human-keys"
git clone git@github.com:rawilk/laravel-app-key-rotator.git "$PACKAGES\laravel-app-key-rotator"
git clone git@github.com:rawilk/laravel-casters.git "$PACKAGES\laravel-casters"
git clone git@github.com:rawilk/laravel-printing.git "$PACKAGES\laravel-printing"
git clone git@github.com:rawilk/laravel-settings.git "$PACKAGES\laravel-settings"
git clone git@github.com:rawilk/laravel-stubs.git "$PACKAGES\laravel-stubs"
git clone git@github.com:rawilk/laravel-ups.git "$PACKAGES\laravel-ups"
git clone git@github.com:rawilk/laravel-webauthn.git "$PACKAGES\laravel-webauthn"
git clone git@github.com:rawilk/package-skeleton-laravel.git "$PACKAGES\package-skeleton-laravel"
git clone git@github.com:rawilk/profile-filament-plugin.git "$PACKAGES\profile-filament-plugin"

git clone git@github.com:rawilk/alpine-ripple.git "$NPM\alpine-ripple"

git clone git@github.com:lifelinecpr/newlife.git "$CLIENTS\lifelinecpr\portal.newlifecpr"

# --------------------------------------------------------------------------
# NPM global packages configuration
# --------------------------------------------------------------------------

Write-Host "`n🧰 Configuring NPM global package directory..." -ForegroundColor Cyan

$npmGlobalDir = "$HOME\.npm-packages"

if (-not (Test-Path $npmGlobalDir)) {
    New-Item -ItemType Directory -Path $npmGlobalDir | Out-Null
    Write-Host "✔️ Created directory: $npmGlobalDir"
}
else {
    Write-Host "ℹ️ Directory already exists: $npmGlobalDir"
}

Write-Host "📦 Setting NPM prefix..."
npm config set prefix $npmGlobalDir
