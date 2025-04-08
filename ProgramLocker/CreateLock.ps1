# Get basic inputs for the process name, the password, and the label (name of the resulting exe)
#####################################################################

Write-Output 'Do not enter any quotes in the following inputs!'
$program = Read-Host 'Enter program path'

# AsSecureString is needed not to show the password in the shell
$password = Read-Host 'Enter password to set' -AsSecureString

# from https://stackoverflow.com/questions/15007104/how-can-i-use-powershells-read-host-function-to-accept-a-password-for-an-extern
$password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

$password2 = Read-Host 'Re-enter password' -AsSecureString
$password2 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password2))


$programName = Read-Host "Label for program"


if ($password -ne $password2) {

    Write-Host "Passwords do not match, try again."
    Start-Sleep -Seconds 1.5
}

$BaseFiie = Join-Path -Path $PSScriptRoot -ChildPath 'LockShortcut.ps1'


# Hash the password and store that in the script to be copied
# Store the hash and the process to run in the new script
#####################################################################


function GetSHA256String{

    param (
        [string]$InputString
    )

    # from https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7.5
    $stringAsStream = [System.IO.MemoryStream]::new()
    $writer = [System.IO.StreamWriter]::new($stringAsStream)
    $writer.Write($InputString)
    $writer.Flush()
    $stringAsStream.Position = 0
    $h = Get-FileHash -InputStream $stringAsStream -Algorithm SHA256 | Select-Object Hash
    $h.Hash
}


$SecretHash = GetSHA256String -InputString $password


# Write the script to the current directory, then convert to an EXE
#####################################################################

$BaseScript = Get-Content $BaseFiie -Raw
$ScriptString = $BaseScript.Replace('ProcessGoesHere', $program).Replace('TrueHashGoesHere', $SecretHash)

$OutFile = Join-Path -Path $PSScriptRoot -ChildPath "tmp-Launch-Program.ps1"
$ScriptString | Out-File -FilePath $OutFile

Write-Output 'Wrote locked program to Launch-Program.ps1'

Invoke-ps2exe $OutFile "$programName.exe"

Remove-Item $OutFile