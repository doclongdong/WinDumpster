
$currentDir = $MyInvocation.MyCommand.Path | Split-Path -Parent
cd $currentDir
$corefilename = "pws.csv"
$tmpfileanme = "pwsbkp.csv.gpg"
$encryptedfilename = "pws.csv.gpg"
Write-Output "Decrypting..."
gpg -o $corefilename -d $encryptedfilename
notepad.exe $corefilename | Out-Null
Write-Output "Encrypting..."
gpg -o $tmpfileanme -c $corefilename
rm $corefilename
rm $encryptedfilename
mv $tmpfileanme $encryptedfilename