

$file = "_Input\1.txt"
$fileContent = Get-Content $file
$fileLineCount = $fileContent.Count

$currentElfCalories = 0

$calorieList = New-Object -TypeName "System.Collections.ArrayList"

$calorieList.Capacity

for ($i = 0; $i -le $fileLineCount; $i++)
{
    $line = $fileContent[$i]
    if($line -ne "" -and $i -ne $fileLineCount){
        $currentElfCalories += $line       

    }
    else {
        $calorieList.Add($currentElfCalories)
        $currentElfCalories = 0
    }
}

$calorieList.Sort()
$topThreeTotal = $calorieList[$calorieList.Count - 1] + $calorieList[$calorieList.Count - 2] + $calorieList[$calorieList.Count - 3]

Write-Host -ForegroundColor Blue $topThreeTotal