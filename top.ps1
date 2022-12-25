
# To add this to all your terminals when running Powershell,
# place this file in the C:\<User>\Documents\Powershell directory
# in a file called profile.ps1

# adapted from https://superuser.com/questions/176624/linux-top-command-for-windows-powershell
function TopWorkAround([int]$numprocs)  {
<#
.SYNOPSIS
    A similar utility to "top" for unix systems.

.DESCRIPTION
    Show processes ordered by CPU usage.

.PARAMETER numprocs
    The number of top processes to show. By default, this is 50
#>

    if (!$numprocs) { $numprocs = 50 } 
    While(1) {ps | sort -des cpu | select -f $numprocs | ft -a; sleep 1; cls}
}