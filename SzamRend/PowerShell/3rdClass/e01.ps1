param(
    [Parameter(Mandatory=$true)]
    [int]$a,
    [Parameter(Mandatory=$true)]
    [int]$b
)

try {
    Write-Output ($a / $b)
}
catch {
    Write-Output "Hiba tortent: $_"
}
trap {
    Write-Output "Hiba tortent: $_"
    continue
}