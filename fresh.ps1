# Run this script with administrator privileges.

# Set script to stop on error
$ErrorActionPreference = 'Stop'

Write-Host "🛠️ Starting  fresh Windows setup..."

# -------------------------------------------------------------------------------------
# 1. Ensure winget is installed
# -------------------------------------------------------------------------------------

if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "🛠️ winget is not installed. Attempting to install App Installer..." -ForegroundColor Yellow

    $appInstallerUri = "https://aka.ms/getwinget"

    try {
        $tempInstaller = "$env:TEMP\AppInstaller.msixbundle"
        Invoke-WebRequest -Uri $appInstallerUri -OutFile $tempInstaller -UseBasicParsing

        Write-Host "📦 Installing App Installer..."
        Add-AppxPackage -Path $tempInstaller

        Remove-Item $tempInstaller -Force
        Write-Host "✅ winget should now be installed. Continuing..." -ForegroundColor Green
    } catch {
        Write-Warning "❌ Automatic winget installation failed."
        Write-Warning "Please manually install App Installer from the Microsoft Store:"
        Write-Warning "https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1"
        exit 1
    }
} else {
    Write-Host "✅ winget is already installed"
}

# -------------------------------------------------------------------------------------
# 2. Ensure Chocolatey is installed
# -------------------------------------------------------------------------------------

if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "🍫 Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force

    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    refreshenv
} else {
    Write-Host "✅ Chocolatey already installed"
}

# -------------------------------------------------------------------------------------
# 3. Ensure Git is installed first
# -------------------------------------------------------------------------------------

if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "⬇️ Installing Git..."
    choco install git --yes
    refreshenv
} else {
    Write-Host "✅ Git is already installed"
}

# -------------------------------------------------------------------------------------
# 4. Set up global .gitignore
# -------------------------------------------------------------------------------------

Write-Host "`n📁 Setting up global .gitignore..."
$gitignorePath = "$HOME\.global-gitignore"
$configSource = "$PSScriptRoot\config\global-gitignore"

if (Test-Path $gitignorePath) {
    Remove-Item $gitignorePath -Force
}
New-Item -ItemType SymbolicLink -Path $gitignorePath -Target $configSource -Force | Out-Null

git config --global core.excludesfile $gitignorePath

# -------------------------------------------------------------------------------------
# 5. Install software (via Chocolatey)
# -------------------------------------------------------------------------------------

& "$PSScriptRoot\setup\software.ps1"
