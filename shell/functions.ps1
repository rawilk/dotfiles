function Generate-Secret {
    param (
        [int]$Bytes = 32
    )

    $randomBytes = [byte[]]::new($Bytes)
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($randomBytes)

    $hex = ($randomBytes | ForEach-Object { $_.ToString("x2") }) -join ''
    Write-Output $hex
}
