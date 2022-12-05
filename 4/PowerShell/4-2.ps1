

$file = "4\_Input\4.txt"

$overlappingPairs = 0

foreach($line in Get-Content $file) {

    $splitOuter = $line.Split(',')
    [int[]]$splitInner1 = $splitOuter[0].Split('-')
    [int[]]$splitInner2 = $splitOuter[1].Split('-')

    if(
        #low digit from 1 in range of 2
        (($splitInner1[0] -ge $splitInner2[0]) -and ($splitInner1[0] -le $splitInner2[1]))  -or
        #high digit of 1 in range of 2
        (($splitInner1[1] -ge $splitInner2[0]) -and ($splitInner1[1] -le $splitInner2[1]))  -or
        #low digit of 2 in range of 1
        (($splitInner2[0] -ge $splitInner1[0]) -and ($splitInner2[0] -le $splitInner1[1]))  -or
        #high digit of 2 in range of 1
        (($splitInner2[1] -ge $splitInner1[0]) -and ($splitInner2[1] -le $splitInner1[1]))
        
        )
        {
            $overlappingPairs++
        }
}

Write-Host $overlappingPairs