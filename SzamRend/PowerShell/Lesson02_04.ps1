# Másodfokú egyenlet megoldása
param(
    [Parameter(Mandatory=$true, Position=0)]
    [double]$a,
    [Parameter(Mandatory=$true, Position=1)]
    [double]$b,
    [Parameter(Mandatory=$true, Position=2)]
    [double]$c
)

# Paraméterek vagy bemenet feldolgozása

$x1 = 0
$x2 = 0
if (($b * $b - 4 * $a * $c) -lt 0) {
    Write-Output "Nincs valos megoldas"
    return
}else {
    $x1 = (-$b + [math]::Sqrt($b * $b - 4 * $a * $c)) / (2 * $a)
    $x2 = (-$b - [math]::Sqrt($b * $b - 4 * $a * $c)) / (2 * $a)
    Write-Output "Az egyenlet megoldasai: $x1, $x2"
}