# Gyerekek file beolvasása
$children = Get-Content -Path "gyerekek.txt"

# Ajándékok beolvasása
$gifts = Get-Content -Path "ajandekok.txt"

$goodChildrenCount = 0
$badChildrenCount = 0
$results = @()

foreach ($child in $children) {
    $parts = $child -split ": "
    $name = $parts[0]
    $behavior = $parts[1]

    if ($behavior -eq "Jó") {
        $goodChildrenCount++
        $gift = Get-Random -InputObject $gifts
        $results += "${name}: Ajandek: ${gift}"
        $gifts = $gifts | Where-Object { $_ -ne $gift }
    } else {
        $badChildrenCount++
        $results += "${name}: Ajandek: szen"
    }
}

# File kiírása
$results | Out-File -FilePath "JezuskaAjandekLista.txt"

# Összesítő
Add-Content -Path "JezuskaAjandekLista.txt" -Value ""
Add-Content -Path "JezuskaAjandekLista.txt" -Value "Jo gyerekek szama: $goodChildrenCount"
Add-Content -Path "JezuskaAjandekLista.txt" -Value "Rossz gyerekek szama: $badChildrenCount"
Add-Content -Path "JezuskaAjandekLista.txt" -Value "Maradek ajandekok szama: $($gifts.Count)"