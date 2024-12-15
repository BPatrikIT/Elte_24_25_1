$words = Get-Content -Path "szavak.txt" -Raw -split "\r?\n" | ForEach-Object { $_ -split " " }

$words = $words | ForEach-Object { $_ }

function New-Poem {
    param (
        [string[]]$words
    )

    $poem = @()
    $usedWords = @()

    while ($usedWords.Count -lt $words.Count) {
        $line = ""
        for ($i = 0; $i -lt 4; $i++) {
            $word = Get-Random -InputObject $words
            while ($usedWords -contains $word) {
                $word = Get-Random -InputObject $words
            }
            $line += "$word "
            $usedWords += $word
        }
        $poem += $line.Trim()
    }

    return $poem -join "`n"
}

$poemFilePath = "Karacsonyivers.txt"
$existingPoems = @()
if (Test-Path -Path $poemFilePath) {
    $existingPoems = Get-Content -Path $poemFilePath -Raw -split "`n`n"
}

do {
    $poem = New-Poem -words $words
} while ($existingPoems -contains $poem)

Add-Content -Path $poemFilePath -Value "`n$poem"

Write-Output $poem