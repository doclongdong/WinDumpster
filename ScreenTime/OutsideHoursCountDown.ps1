# Note for the greyscale to work, you need AutoHotkeyV2 installed

$i = 60

$min = Get-Date '18:00'
$max = Get-Date '23:30'
$now = Get-Date

if (($now.TimeOfDay -le $min.TimeOfDay) -or ($now.TimeOfDay -ge $max.TimeOfDay)) {
    Sleep 5
    $header = Split-Path -Parent $PSCommandPath
    $fullPath = Join-Path -Path $header -ChildPath "GreyScale.ahk"
    PowerShell $fullPath
	do {
		Write-Host "Outside hours: Seconds to logout" $i
	        Sleep 1
		$i--
	} while ($i -gt 0)

# Write-Host "Locking screen"
# rundll32.exe user32.dll,LockWorkStation
Write-Host "Shutting Down"
shutdown /s

} else{
	Write-Host "Usage is allowed"
	Sleep 1
}


