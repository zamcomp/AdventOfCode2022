<#
    [P]                 [Q]     [T]
[F] [N]             [P] [L]     [M]
[H] [T] [H]         [M] [H]     [Z]
[M] [C] [P]     [Q] [R] [C]     [J]
[T] [J] [M] [F] [L] [G] [R]     [Q]
[V] [G] [D] [V] [G] [D] [N] [W] [L]
[L] [Q] [S] [B] [H] [B] [M] [L] [D]
[D] [H] [R] [L] [N] [W] [G] [C] [R]
 1   2   3   4   5   6   7   8   9 

#>


$file = "5\_Input\5.txt"
$fileContent = Get-Content $file
$nLines = $fileContent.Length

#Find where diagram ends and instructuions begin
$diagramBottomRow = -1
$instructuonStart = -1

for($i = 0; $i -lt $nLines; $i++)
{
    $currentLine = $fileContent[$i]
    
    if($currentLine.StartsWith(' 1 '))
    {
        $diagramBottomRow = $i - 1
        $instructuonStart = $i + 2
    }
}

#Build initial arrays from diagram
#If more than 9 stacks this likely wouldn't work as expected, due to formatting variations in the input file

#Init
$nStacks = ($fileContent[$diagramBottomRow].Length + 1 ) / 4
$fatStacks = [System.Collections.ArrayList[]]::new($nStacks)

for($i = 0; $i -lt $nStacks; $i++)
{
    $fatStacks[$i]= New-Object -TypeName "System.Collections.ArrayList"
}


#Populate initial values
for($i = $diagramBottomRow ; $i -ge 0; $i--)
{
    $line = $fileContent[$i]

    for($j=0; $j -lt $nStacks; $j++)
    {
        $crate = $line.Substring((1+ $j*4),1)

        if($crate -ne ' ')
        {
            $fatStacks[$j].Add($crate)
        }
    }
}


#Move the crates
for($i = $instructuonStart ; $i -lt $nLines; $i++)
{
    $line = $fileContent[$i]

    $processedLine = $line.Replace('move ','').Replace(' from ',',').Replace(' to ',',')
    $processedLineSplit = $processedLine.Split(',')

    $cratesToMove = [int]$processedLineSplit[0]
    $moveFrom = [int]$processedLineSplit[1] - 1
    $moveTo  = [int]$processedLineSplit[2] - 1

    #for the number of crates to move
    for($j = 0;$j -lt $cratesToMove; $j++)
    {
        #get index of top crate to be moved
        $fromIndex = $fatStacks[$moveFrom].Count -1
        #get value of top crate to be moved
        $crateValue = $fatStacks[$moveFrom][$fromIndex]
        #add crate to destination stack
        $fatStacks[$moveTo].Add($crateValue)
        #remove crate from source stack
        $fatStacks[$moveFrom].RemoveAt($fromIndex)

    }

}

$result = ''
foreach($stack in $fatstacks)
{
    $result+= $stack[$stack.Count -1]
}

Write-Host $result -ForegroundColor Blue