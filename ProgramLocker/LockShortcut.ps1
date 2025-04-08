$password = Read-Host 'Password' -AsSecureString
$password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

$process = 'ProcessGoesHere'
$TrueHash = 'TrueHashGoesHere'


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

$Hash = GetSHA256String -InputString $password

$granted = $Hash -eq $TrueHash

if ($granted) {
    Start-Process $process
}
else {
    Write-Output 'Access denied!'
    Start-Sleep -Seconds 1.5

}

