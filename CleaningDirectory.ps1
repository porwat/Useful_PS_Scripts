$Path = "C:\Users\Piotr\Desktop\TestDir"

$a = get-date (get-date).AddMonths(-1)
Get-ChildItem -Path $Path | Where {$_.Attributes -EQ "Directory" -And $_.CreationTime -gt $a} | Remove-Item -Recurse -WhatIf