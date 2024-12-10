param (
    [string]$directoryPath
)

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath -PathType Container)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Get all files in the directory
$files = Get-ChildItem -Path $directoryPath -File

foreach ($file in $files) {
    # Get the first letter of the filename
    $firstLetter = $file.Name.Substring(0, 1).ToUpper()

    # Create the subdirectory if it doesn't exist
    $subDir = Join-Path -Path $directoryPath -ChildPath $firstLetter
    if (-Not (Test-Path -Path $subDir -PathType Container)) {
        New-Item -Path $subDir -ItemType Directory | Out-Null
    }

    # Move the file to the subdirectory
    $destination = Join-Path -Path $subDir -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destination
}

Write-Host "Files have been sorted into subdirectories based on their first letter."