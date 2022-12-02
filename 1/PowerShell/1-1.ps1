

$file = "_Input\1.txt"

$mostCalories = 0
$currentElfCalories = 0

foreach($line in Get-Content $file) {
    if($line -ne ""){
        $currentElfCalories += $line
        
        if($currentElfCalories -gt $mostCalories){$mostCalories = $currentElfCalories}
    }
    else {
        $currentElfCalories = 0
    }

}

Write-Host -ForegroundColor Blue $mostCalories