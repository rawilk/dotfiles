$ErrorActionPreference = 'Stop'

# --------------------------------------------------------------------------
# Chocolatey installs
# --------------------------------------------------------------------------

Write-Host "`n📦 Installing software with Chocolatey..."

$packages = @(
    "1password",
    "adguard",
    "discord",
    "epicgameslauncher",
    "googlechrome",
    "herd", # Laravel Herd
    "logitech-options",
    "phpstorm",
    "spotify",
    "steam",
    "warp-terminal"
)

foreach ($pkg in $packages) {
    Write-Host "➡️ [choco] Installing $pkg..."
    choco install $pkg --yes --ignore-checksums
}

# --------------------------------------------------------------------------
# Winget installs (for packages not available via Chocolatey)
# --------------------------------------------------------------------------

Write-Host "`n📦 Installing additional software with Winget..."

$wingetPackages = @(
    "Asus.ArmouryCrate",
    "WeMod.WeMod"
)

foreach ($pkg in $wingetPackages) {
    Write-Host "➡️ [winget] Installing $pkg..."
    winget install --id $pkg --accept-source-agreements --accept-package-agreements
}
