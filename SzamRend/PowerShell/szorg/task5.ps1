param (
    [string]$directoryPath
)

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath)) {
    Write-Host "The directory does not exist."
    exit
}

# Create subdirectories for small, medium, and large files
$smallDir = Join-Path -Path $directoryPath -ChildPath "Small"
$mediumDir = Join-Path -Path $directoryPath -ChildPath "Medium"
$largeDir = Join-Path -Path $directoryPath -ChildPath "Large"

New-Item -ItemType Directory -Path $smallDir -Force | Out-Null
New-Item -ItemType Directory -Path $mediumDir -Force | Out-Null
New-Item -ItemType Directory -Path $largeDir -Force | Out-Null

# Get all files in the directory
$files = Get-ChildItem -Path $directoryPath -File

foreach ($file in $files) {
    $fileSizeMB = [math]::Round($file.Length / 1MB, 2)

    if ($fileSizeMB -lt 1) {
        Move-Item -Path $file.FullName -Destination $smallDir
    } elseif ($fileSizeMB -ge 1 -and $fileSizeMB -le 10) {
        Move-Item -Path $file.FullName -Destination $mediumDir
    } else {
        Move-Item -Path $file.FullName -Destination $largeDir
    }
}

Write-Host "Files have been categorized based on their size."