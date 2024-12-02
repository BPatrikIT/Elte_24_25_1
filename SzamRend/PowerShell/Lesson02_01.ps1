param(
    [Parameter(Mandatory=$true)]
    [int]$n
)

# Faktoriális számítás
$factorial = 1

for ($i = 1; $i -le $n; $i++) {
    $factorial *= $i
}

Write-Output "A $n faktorialisa: $factorial"