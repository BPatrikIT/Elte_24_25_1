# Mentési mappa létrehozása
$levelekDir = "Levelek"
if (-not (Test-Path -Path $levelekDir)) {
    New-Item -ItemType Directory -Path $levelekDir
}

# File beolvasása
$kivansagokFile = "kivansagok.txt"
$kivansagok = Get-Content -Path $kivansagokFile

# Hibák fájljának létrehozása
$errorLogFile = "hibak.txt"
Clear-Content -Path $errorLogFile -ErrorAction SilentlyContinue

# Sorok feldolgozása
foreach ($line in $kivansagok) {
    $parts = $line.Split(":", 2)
    if ($parts.Count -eq 2) {
        $name = $parts[0].Trim()
        $wish = $parts[1].Trim()

        if ($name -and $wish) {
            $filePath = Join-Path -Path $levelekDir -ChildPath "$name.txt"
            $message = "Kedves $name! A kivansagodat rogzitettuk: $wish. Udvozlettel, Jezuska"

            if (Test-Path -Path $filePath) {
                add-Content -Path $filePath -Value "`nA kivansag mar fel van jegyezve: $(Get-Date -Format 'yyyy-MM-dd')"
            } else {
                $message | Out-File -FilePath $filePath
            }
        } else {
            Add-Content -Path $errorLogFile -Value "Hibas sor: $line"
        }
    } else {
        Add-content -Path $errorLogFile -Value "Hibas sor: $line"
    }
}

# Sajnos ide nem tudtam random hóembert rajzonli, pedig megpróbáltam :(