


$file = "6\_Input\6.txt"
$fileContent = Get-Content $file

$messageLength = $fileContent.Length
$currentIndex = 0
$foundMarker = -1

while($currentIndex -lt ($messageLength - 3) -and ($foundMarker -eq -1))
{
    $string = $fileContent.Substring($currentIndex,4)

    if(-not($string.ToCharArray() | group -NoElement | ? Count -gt 1))
    {
        $foundMarker = $currentIndex + 4
    }

    $currentIndex++
}

Write-Host $foundMarker -ForegroundColor Blue