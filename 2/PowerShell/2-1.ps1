
# Points Matrix
#          X   Y   Z
#       |------------
#   A   |  4   8   3
#   B   |  1   5   9
#   C   |  7   2   6


$pointsArray = @(
[PSCustomObject]@{Opponent = 'A';  Player = 'X'; Score = 4},
[PSCustomObject]@{Opponent = 'A';  Player = 'Y'; Score = 8},
[PSCustomObject]@{Opponent = 'A';  Player = 'Z'; Score = 3},

[PSCustomObject]@{Opponent = 'B';  Player = 'X'; Score = 1},
[PSCustomObject]@{Opponent = 'B';  Player = 'Y'; Score = 5},
[PSCustomObject]@{Opponent = 'B';  Player = 'Z'; Score = 9},

[PSCustomObject]@{Opponent = 'C';  Player = 'X'; Score = 7},
[PSCustomObject]@{Opponent = 'C';  Player = 'Y'; Score = 2},
[PSCustomObject]@{Opponent = 'C';  Player = 'Z'; Score = 6}
)


$file = "2\_Input\2.txt"

$totalScore = 0

foreach($line in Get-Content $file) {
    
    $op = $line[0]
    $pl = $line[2]
    $totalScore += ($pointsArray | ? {$_.Opponent -eq $op -and $_.Player -eq $pl}).Score

}


Write-Host -ForegroundColor Blue $totalScore
