
$file = "4\_Input\4.txt"

$containedTotal = 0

foreach($line in Get-Content $file) {

    $splitOuter = $line.Split(',')
    [int[]]$splitInner1 = $splitOuter[0].Split('-')
    [int[]]$splitInner2 = $splitOuter[1].Split('-')

    if((($splitInner1[0] -ge $splitInner2[0]) -and ($splitInner1[1] -le $splitInner2[1]))  -or
        (($splitInner2[0] -ge $splitInner1[0]) -and ($splitInner2[1] -le $splitInner1[1]))
        )
        {
            $containedTotal++
        }
}

Write-Host $containedTotal