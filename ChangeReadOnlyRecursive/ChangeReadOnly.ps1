# Thanks to chatgpt for helping here

# Define the root folder path
$rootFolder = "./"

# Check if the folder exists
if (-Not (Test-Path $rootFolder)) {
    Write-Host "The folder '$rootFolder' does not exist."
    exit
}

# Get all files and folders recursively (including the root folder itself)
$items = Get-ChildItem -Path $rootFolder -Recurse -Force
$items += Get-Item -Path $rootFolder

# Loop through each item and remove the ReadOnly attribute if set
foreach ($item in $items) {
    if ($item.Attributes -band [System.IO.FileAttributes]::ReadOnly) {
        # Remove the ReadOnly attribute
        $item.Attributes = $item.Attributes -bxor [System.IO.FileAttributes]::ReadOnly
        Write-Host "Removed ReadOnly: $($item.FullName)"
    }
}