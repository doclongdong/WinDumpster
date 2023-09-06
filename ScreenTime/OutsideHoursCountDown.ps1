# Note for the greyscale to work, you need AutoHotkeyV2 installed

$i = 600

$min = Get-Date '08:00'
$max = Get-Date '16:01'
$now = Get-Date

if ($now.TimeOfDay -le $min.TimeOfDay -or $now.TimeOfDay -ge $max.TimeOfDay) {
    $header = Split-Path -Parent $PSCommandPath
    $fullPath = Join-Path -Path $header -ChildPath "GreyScale.ahk"
    PowerShell $fullPath
	do {
		Write-Host "Outside hours: Seconds to logout" $i
	        Sleep 1
		$i--
	} while ($i -gt 0)

Write-Host "Locking screen"
rundll32.exe user32.dll,LockWorkStation

} else{
	Write-Host "Usage is allowed"
}


