param (
    [string]$directoryPath,
    [string]$extension
)

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Get all files with the specified extension in the directory
$files = Get-ChildItem -Path $directoryPath -Filter "*.$extension"

# Delete each file
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Force
    Write-Host "Deleted file: $($file.FullName)"
}

Write-Host "All files with the extension .$extension have been deleted from $directoryPath."