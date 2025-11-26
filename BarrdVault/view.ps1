# move execution context to the directory of this file, and set paths
$currentDir = $MyInvocation.MyCommand.Path | Split-Path -Parent
cd $currentDir
$corefilename = "pws.csv"
$encryptedfilename = "pws.csv.gpg"

# decrypt, show, and delete 
Write-Output "Decrypting..."
gpg -o $corefilename -d $encryptedfilename
Import-Csv -Path $corefilename | Out-GridView
rm $corefilename
Write-Output "Deleting decrypted file $corefilename"
Read-Host "Press any key to close"