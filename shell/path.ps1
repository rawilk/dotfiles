function Add-ToPath {
    param (
        [string]$PathToAdd,
        [switch]$Persist
    )

    if ([string]::IsNullOrWhiteSpace($PathToAdd)) { return }

    $fullPath = [System.IO.Path]::GetFullPath($PathToAdd)

    if (-not (Test-Path $fullPath)) {
        return
    }

    # Add to current session PATH
    if (-not ($env:Path.Split(';') -contains $fullPath)) {
        $env:Path = "$fullPath;$env:Path"
    }

    # Add to persistent user PATH if requested
    if ($Persist) {
        $currentUserPath = [Environment]::GetEnvironmentVariable("Path", "User") -split ';'
        if (-not ($currentUserPath -contains $fullPath)) {
            $newPath = ($currentUserPath + $fullPath) -join ';'
            [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
            Write-Host "✅ Persisted to user PATH: $fullPath"
        }
    }
}

# Add paths — pass -Persist for each one you want to be permanent
Add-ToPath "$HOME\dotfiles\bin" -Persist
Add-ToPath "$HOME\AppData\Roaming\Composer\vendor\bin" -Persist
Add-ToPath "$HOME\.node\bin" -Persist
Add-ToPath "$HOME\.npm-packages\bin" -Persist
Add-ToPath "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI" -Persist
Add-ToPath "C:\Program Files\JetBrains\PhpStorm\bin" -Persist

# Project-local
Add-ToPath "vendor\bin" -Persist
Add-ToPath "node_modules\.bin" -Persist
