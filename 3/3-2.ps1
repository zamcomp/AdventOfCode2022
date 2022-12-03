$file = "3\_Input\3.txt"

$totalPriority = 0

$fileContent = Get-Content $file
$nLines  = $fileContent.Length

for($i =0;$i -le $nLines - 2;$i = $i + 3)
{
    $elf1 = $fileContent[$i]
    $elf2 = $fileContent[$i+1]
    $elf3 = $fileContent[$i+2]

    $charCounter = 0
    $matchPosition2 = -1
    $matchPosition3 = -1
    $priority = 0

    while(($matchPosition2 -eq -1) -or ($matchPosition3 -eq -1))
    {
        $char = $elf1[$charCounter]
        $matchPosition2 = $elf2.IndexOf($char)
        $matchPosition3 = $elf3.IndexOf($char) 
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

