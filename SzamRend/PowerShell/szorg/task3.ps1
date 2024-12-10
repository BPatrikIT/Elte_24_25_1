param (
    [string]$inputFile,
    [string]$outputFile,
    [string]$searchExpression,
    [int]$searchNumber
)

# Read the input file
$content = Get-Content -Path $inputFile

# Filter lines containing the search expression and number
$filteredLines = $content | Where-Object { $_ -match $searchExpression -and $_ -match $searchNumber }

# Write the filtered lines to the output file
$filteredLines | Out-File -FilePath $outputFile

Write-Host "Filtered lines have been written to $outputFile"