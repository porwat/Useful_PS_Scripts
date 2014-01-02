#This script remove all directories older than a month

$Path = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition #Get current path
$Exclusion = "Dir1", "Dir2"

$a = get-date (get-date).AddMonths(-1)
Get-ChildItem -Path $Path | Where {$_.Attributes -EQ "Directory" -And $_.CreationTime -LT $a -And $_.Name -and ($Exclusion -notcontains $_.Name) } | Remove-Item -Recurse -WhatIf