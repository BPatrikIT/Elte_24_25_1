param(
    [Parameter(Mandatory=$true)]
    [int] $kuszob
)

$adatfile = "auto_adatok.csv"
$fekezesek = 0

try {
    $content = Get-Content $adatfile
    foreach ($line in $content) {
        $adatok = $line -split ","
        $ido = $adatok[0]
        $sebesseg = $adatok[1]
        [int] $tavolsag_elol = $adatok[2]
        [int] $tavolsag_hatul = $adatok[3]
        Write-Output "Ido: $ido, sebesseg: $sebesseg, tavolsag elol: $tavolsag_elol, tavolsag hatul: $tavolsag_hatul"
        if ($tavolsag_elol -lt $kuszob) {
            $fekezesek++
            Write-Output "Fekezett az auto!"
        }
    }
    Write-Output "Az auto osszesen $fekezesek-szor fekezett."
}
catch {
    Write-Output "Hiba tortent: $_"
}