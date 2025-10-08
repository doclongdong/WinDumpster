# Note for the greyscale to work, you need AutoHotkeyV2 installed
# For notifications to work, you need to install Burnt-Toast notifications in powershell

$i = 10

# this very narrow scheduled time for the user is between 7pm-9pm, outside of that the 
# computer will screentime-lock+shutdown
$min = Get-Date '19:00'
$max = Get-Date '21:00'
$now = Get-Date

if (($now.TimeOfDay -le $min.TimeOfDay) -or ($now.TimeOfDay -ge $max.TimeOfDay)) {
    # Sleep 5
    $header = Split-Path -Parent $PSCommandPath
	
	
	# Run Grayscale, if possible
    $grayscalePath = Join-Path -Path $header -ChildPath "GreyScale.ahk"
    # only trigger grayscale if needed
    $grayScaleOn = Get-ItemPropertyValue 'Registry::\HKEY_CURRENT_USER\Software\Microsoft\ColorFiltering' -Name Active
    if ($grayScaleOn -eq 0) {
        PowerShell $grayscalePath
    }
	
	# Run notification, if possible
	$notificationLogoPath = Join-Path -Path $header -ChildPath "na.jpg"
	

    New-BurntToastNotification -Text "ScreenTime", "ScreenTime locking screen in $i seconds." -AppLogo $notificationLogoPath

    
    do {
        Write-Host "Outside hours: Seconds to logout" $i
	Sleep 1
        $i--
    } while ($i -gt 0)


# Immediately lock the screen, then initiate shutdown in 5 minutes.
Write-Host "Locking screen"
rundll32.exe user32.dll,LockWorkStation

Write-Host "Waiting 5 minutes before shutdown"
Sleep 300
Write-Host "Shutting Down"
Shutdown /s
# Write-Host "Logging off"
# logoff

} else{
	Write-Host "Usage is allowed"
	Sleep 1
}


