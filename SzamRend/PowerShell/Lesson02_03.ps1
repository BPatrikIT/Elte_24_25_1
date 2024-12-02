param(
    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [int[]]$numbers
)

# Paraméterek vagy bemenet feldolgozása
begin {
    $sum = 0
}
process {
    foreach ($num in $numbers) {
        $sum += $num
    }
}
end {
    Write-Output "Az összeg: $sum"
}