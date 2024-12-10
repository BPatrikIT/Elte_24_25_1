param (
    [string]$path = ".",
    [datetime]$startDate,
    [datetime]$endDate
)

if (-not $startDate -or -not $endDate) {
    Write-Host "Please provide both startDate and endDate parameters."
    exit
}

Get-ChildItem -Path $path -Recurse | Where-Object {
    $_.LastWriteTime -ge $startDate -and $_.LastWriteTime -le $endDate
} | ForEach-Object {
    Write-Output $_.FullName
}