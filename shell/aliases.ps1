# Directory switching
Set-Alias .. Set-Location ..
Set-Alias ... Set-Location ../..
Set-Alias .... Set-Location ../../..
Function home { Set-Location ~ }

Function personal { Set-Location "$HOME\dev\code\personal" }
Function work { Set-Location "$HOME\dev\code\work" }
Function packages { Set-Location "$HOME\dev\code\packages" }
Function rite { Set-Location "$HOME\dev\code\work\rite" }
Function randallwilk { Set-Location "$HOME\dev\code\personal\randallwilk.dev" }

# PHP tooling
Function phpunit     { & "vendor/bin/phpunit" @args }
Function phpunitw    { & "phpunit-watcher" "watch" }
Function a           { & "herd" "php" "artisan" @args }
Function cu          { & "herd" "composer" "update" @args }
Function cr          { & "herd" "composer" "require" @args }
Function crm         { & "herd" "composer" "remove" @args }
Function clow        { & "herd" "composer" "update" "--prefer-lowest" "--prefer-dist" "--no-interaction" }
Function cstable     { & "herd" "composer" "update" "--prefer-stable" "--prefer-dist" "--no-interaction" }
Function canvas      { & "composer" "exec" "canvas" @args }
Function cfresh      { Remove-Item -Recurse -Force "vendor", "composer.lock"; & "composer" "install" }
Function cda         { & "composer" "dump-autoload" "-o" }
Function hostfile    { Start-Process "notepad" -ArgumentList "C:\Windows\System32\drivers\etc\hosts" -Verb RunAs }
Function mfs         { & "php" "artisan" "migrate:fresh" "--seed" }
Function p           { & "vendor/bin/pest" @args }
Function pf          { & "vendor/bin/pest" "--filter" @args }
Function pint        { & "vendor/bin/pint" @args }
Function pintd       { & "vendor/bin/pint" "--dirty" @args }
Function php         { & "herd" "php" @args }

# File listing (cross-platform long list)
Function l           { Get-ChildItem -Force | Format-List }

# Networking
Function ip {
    Invoke-RestMethod -Uri "https://diagnostic.opendns.com/myip"
}

Function localip {
    Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.IPAddress -notlike "169.*" } | Select-Object -ExpandProperty IPAddress
}

Function macaddress {
    Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1 -ExpandProperty MacAddress
}
