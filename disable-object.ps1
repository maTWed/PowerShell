<#
.AUTHOR AND DATE
maTWed - Matt Weddle
9/25/2020

.SYNOPSIS
Quickly move machine or user to disable OU

.DISCRIPTION
Two functions exist - One to disable a user and one to disable a machine

.EXAMPLE
userDisable -Name "user name"
machineDisable -Name "machine name"
#>


function userDisable
{
param($Name)
    "User Name: " + $Name

$TargetOU = "OU=Disabled Users,OU=Disabled,DC=DOMAIN,DC=LOCAL"
Get-ADUser $Name | Move-ADObject -TargetPath $TargetOU

Write-Output "User: $Name was moved to $TargetOU"
}


function machineDisable
{
param($Name)
    "Machine Name: " + $Name

$TargetOU = "OU=Disabled Computers,OU=Disabled,DC=DOMAIN,DC=LOCAL"
Get-ADComputer $Name | Move-ADObject -TargetPath $TargetOU

Write-Output "Machine: $Name moved to $TargetOU"
}
