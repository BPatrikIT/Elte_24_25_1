param (
    [string]$directoryPath
)

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Get the current date and time
$currentDate = Get-Date

# Calculate the date 5 days ago
$pastDate = $currentDate.AddDays(-5)

# Get the list of files modified in the last 5 days
$modifiedFiles = Get-ChildItem -Path $directoryPath -Recurse | Where-Object { $_.LastWriteTime -ge $pastDate }

# Define the log file path
$logFilePath = Join-Path -Path $directoryPath -ChildPath "modification_log.txt"

# Write the details of modified files to the log file
foreach ($file in $modifiedFiles) {
    $logEntry = "File: $($file.FullName), Last Modified: $($file.LastWriteTime)"
    Add-Content -Path $logFilePath -Value $logEntry
}

Write-Host "Log file created at $logFilePath"