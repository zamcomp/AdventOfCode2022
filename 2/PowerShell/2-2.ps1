
# Original Points Matrix
#          X   Y   Z
#       |------------
#   A   |  4   8   3
#   B   |  1   5   9
#   C   |  7   2   6


# Updated Points Matrix
#          X   Y   Z
#       |------------
#   A   |  3   4   8
#   B   |  1   5   9
#   C   |  2   6   7



$pointsArray = @(
[PSCustomObject]@{Opponent = 'A';  Action = 'X'; Score = 3},
[PSCustomObject]@{Opponent = 'A';  Action = 'Y'; Score = 4},
[PSCustomObject]@{Opponent = 'A';  Action = 'Z'; Score = 8},

[PSCustomObject]@{Opponent = 'B';  Action = 'X'; Score = 1},
[PSCustomObject]@{Opponent = 'B';  Action = 'Y'; Score = 5},
[PSCustomObject]@{Opponent = 'B';  Action = 'Z'; Score = 9},

[PSCustomObject]@{Opponent = 'C';  Action = 'X'; Score = 2},
[PSCustomObject]@{Opponent = 'C';  Action = 'Y'; Score = 6},
[PSCustomObject]@{Opponent = 'C';  Action = 'Z'; Score = 7}
)


$file = "2\_Input\2.txt"

$totalScore = 0

foreach($line in Get-Content $file) {
    
    $op = $line[0]
    $pl = $line[2]
    $totalScore += ($pointsArray | ? {$_.Opponent -eq $op -and $_.Action -eq $pl}).Score

}


Write-Host -ForegroundColor Blue $totalScore
