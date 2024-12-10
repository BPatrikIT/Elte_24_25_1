param (
    [string]$folderPath
)

# Function to generate a random password
function New-Password {
    param (
        [int]$length = 12
    )
    $password = -join ((65..90) + (97..122) + (48..57) + (33..47) | Get-Random -Count $length | ForEach-Object {[char]$_})
    return $password
}

# Check if the folder exists
if (-Not (Test-Path -Path $folderPath -PathType Container)) {
    Write-Host "The specified folder does not exist."
    exit
}

# Get all directories in the specified folder
$directories = Get-ChildItem -Path $folderPath -Directory

# Create a hashtable to store directory names and their passwords
$passwords = @{}

foreach ($dir in $directories) {
    $passwords[$dir.Name] = Generate-Password
    $passwords[$dir.Name] = New-Password
}

# Save the passwords to a file
$outputFile = Join-Path -Path $folderPath -ChildPath "passwords.txt"
$passwords.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value)" } | Set-Content -Path $outputFile

Write-Host "Passwords have been generated and saved to $outputFile"