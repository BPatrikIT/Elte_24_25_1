$tasks = Get-Content -Path "teendok.txt"

$completedCount = 0
$pendingCount = 0

$outputFile = "EllenorzottTeendok.txt"
Clear-Content -Path $outputFile

foreach ($task in $tasks) {
    $status = Read-Host "Elkeszult a kovetkezo teendo? ($task) (igen/nem)"
    if ($status -eq "igen") {
        $completedCount++
        $statusText = "kesz"
    } else {
        $pendingCount++
        $statusText = "Nem kesz"
    }
    Add-Content -Path $outputFile -Value "${task}: ${statusText}"
}

Write-Host "Osszesites:"
Write-Host "KEsz feladatok szama: $completedCount"
Write-Host "Hatralevo feladatok szama: $pendingCount"

if ($pendingCount -eq 0) {
    Write-Host "Minden keszen all az unnepekre! Koszonom a segitseget!"
}