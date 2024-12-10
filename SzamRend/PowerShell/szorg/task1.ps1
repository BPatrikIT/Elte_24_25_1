param (
    [string]$file1,
    [string]$file2
)

# Check if files exist
if (-Not (Test-Path $file1)) {
    Write-Host "File $file1 does not exist."
    exit
}

if (-Not (Test-Path $file2)) {
    Write-Host "File $file2 does not exist."
    exit
}

# Get file sizes
$file1Size = (Get-Item $file1).Length
$file2Size = (Get-Item $file2).Length

# Perform division with error handling
try {
    $result = $file1Size / $file2Size
    Write-Host "The result of dividing the size of $file1 by the size of $file2 is: $result"
} catch {
    Write-Host "Error: Division by zero is not allowed."
}