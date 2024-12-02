param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [int[]]$numbers
)

# Paraméterek összegzése
$sum = 0
foreach ($num in $numbers) {
    $sum += $num
}

Write-Output "Az osszeg: $sum"