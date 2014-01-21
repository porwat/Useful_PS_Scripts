#Script fills out OfficePhone with data from csv file
#CSV file format "Name; Number"


$people = Import-Csv -Path "Path_to_CSV_file" -Delimiter ';' 
Import-Module -Name 'ActiveDirectory'

Foreach ($person in $people){
  $PersonName = $Person | Select-Object -ExpandProperty Name
  $PersonPhone = $Person | Select-Object -ExpandProperty Number
  $array = $PersonName.split(" ")
  $InvPerson = $array[1]+' '+$array[0]
  Get-ADUser -Filter { Name -eq $InvPerson } | Set-ADUser -OfficePhone $PersonPhone
}
