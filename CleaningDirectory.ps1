#This script remove all directories older than a month

$Path = "Path_To_Dir"

$a = get-date (get-date).AddMonths(-1)
Get-ChildItem -Path $Path | Where {$_.Attributes -EQ "Directory" -And $_.CreationTime -LT $a} | Remove-Item -Recurse -WhatIf