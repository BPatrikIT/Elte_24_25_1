# Define the minimum file size in bytes
$minFileSize = 1000

# Define the date range (last 10 days)
$dateLimit = (Get-Date).AddDays(-10)

# Get the list of files in the current directory that match the criteria
Get-ChildItem -File | Where-Object {
    $_.Length -gt $minFileSize -and $_.LastWriteTime -gt $dateLimit
} | Select-Object Name, Length, LastWriteTime