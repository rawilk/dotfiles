# -------------------------------------------------------------------------------------
# Add PowerShell profile that loads aliases
# -------------------------------------------------------------------------------------

Write-Host "`n📝 Setting up PowerShell profile..."

$profileTarget = "$PROFILE"
$shellDir = "$HOME\dotfiles\shell"

$shellIncludes = @(
    @{ path = "$shellDir\aliases.ps1";  comment = "Load custom aliases from dotfiles" },
    @{ path = "$shellDir\functions.ps1"; comment = "Load custom functions from dotfiles" },
    @{ path = "$shellDir\path.ps1";      comment = "Add custom PATH entries from dotfiles" }
)

if (!(Test-Path -Path $profileTarget)) {
    New-Item -ItemType File -Path $profileTarget -Force | Out-Null
}

foreach ($include in $shellIncludes) {
    $importPath = $include.path
    $comment    = $include.comment

    if (-not (Get-Content $profileTarget | Select-String -Pattern [regex]::Escape($importPath))) {
        Add-Content $profileTarget "`n# $comment"
        Add-Content $profileTarget ". `"$importPath`""
        Write-Host "✅ Added: $comment"
    }
    else {
        Write-Host "ℹ️ Already included: $importPath"
    }
}
