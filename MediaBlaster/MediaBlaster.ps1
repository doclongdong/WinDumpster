


# Change to the directory containing this script — works in all contexts

if ($PSScriptRoot) {
    # Works when the script is executed normally
    Set-Location -Path $PSScriptRoot
}
else {
    # Fallback for interactive sessions, ISE, or dot-sourcing
    $scriptPath = $MyInvocation.MyCommand.Definition
    if (-not [string]::IsNullOrEmpty($scriptPath)) {
        $scriptDir = Split-Path -Parent (Resolve-Path $scriptPath)
        Set-Location -Path $scriptDir
    }
    else {
        Write-Host "Cannot determine script directory (running interactively?)."
    }
}

Write-Host "Now in: $(Get-Location)"


# Run the url opener
Get-ChildItem -Path "./Sources" -Filter *.url | ForEach-Object {
	    Start-Process $_.FullName
}
