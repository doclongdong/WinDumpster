$i = 10

do {
    Write-Host "Outside hours: Seconds to logout" $i
    Sleep 1
    $i--
} while ($i -gt 0)

Write-Host "Locking screen"
rundll32.exe user32.dll,LockWorkStation