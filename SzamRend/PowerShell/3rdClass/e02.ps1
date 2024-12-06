param(
    [Parameter(Mandatory=$true)]
    [string[]] $lista
)

foreach ($elem in $lista) {
    Remove-Item $elem -ErrorAction SilentlyContinue
}

Write-Output "A megadott fajlok torolve lettek"