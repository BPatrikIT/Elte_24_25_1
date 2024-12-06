param(
    [Parameter(Mandatory=$true)]
    [string] $inputfile,
    [Parameter(Mandatory=$true)]
    [string] $outputFile,
    [Parameter(Mandatory=$true)]
    [string] $keresendoTartalom
)

try {
    $content = Get-Content $inputfile
    $content | Where-Object {$_ -like "*$keresendoTartalom*"} | Set-Content $outputFile
    Write-Output "A keresett tartalmu sorok ki lettek irva $outputFile fajlba"
}
catch {
    Write-Output "Hiba tortent: $_"
}

try {
    $content2 = Get-Content $inputfile
    $content2 | Where-Object {$_ -like "*??*"} | Set-Content "nep2.txt"
}
catch {
    Write-Output "Hiba tortent: $_"
}

try {
    $content3 = Get-Content $inputfile
    foreach ($line in $content3) {
        if ($line -match "[a-zA-Z]{2}") {
            $line | Add-Content "nep3.txt"
        }
    }
}
catch {
    Write-Output "Hiba tortent: $_"
}
