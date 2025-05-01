# Thanks to chatgpt for helping here

# Define the root folder path
$rootFolder = "./"

# Check if the folder exists
if (-Not (Test-Path $rootFolder)) {
    Write-Host "The folder '$rootFolder' does not exist."
    exit
}

# Get all files and folders recursively
$items = Get-ChildItem -Path $rootFolder -Recurse -Force

# Loop through each item and check for ReadOnly attribute
foreach ($item in $items) {
    if ($item.Attributes -band [System.IO.FileAttributes]::ReadOnly) {
        Write-Host "ReadOnly: $($item.FullName)"
    }
}