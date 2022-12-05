$file = "3\_Input\3.txt"

$totalPriority = 0

foreach($line in Get-Content $file) {
    
    $compSize = $line.Length / 2
    $comp1 = $line.Substring(0,$compSize)
    $comp2 = $line.Substring($compSize)

    $charCounter = 0
    $matchPosition = -1
    $priority = 0

    while($matchPosition -eq -1)
    {
        $char = $comp1[$charCounter]
        $matchPosition = $comp2.IndexOf($char) 
        $charCounter++
    }

    $ascii = [byte][char]$char
    #Uppercase - Ascii value 65 - 90 inclusive
    if($ascii -gt 64 -and $ascii -lt 91 )
    {
        $priority = $ascii - 38
    }
    #Lowercase - Ascii value 97 - 123 inclusive
    elseif($ascii -gt 96 -and $ascii -lt 123 )
    {
        $priority = $ascii - 96
    }
    else {
        Write-Host "Unexpected character, something has gone very wrong here" -ForegroundColor Red
        Exit 1
    }

    $totalPriority+=$priority
        

}

Write-Host $totalPriority

