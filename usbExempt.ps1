<#
    File: usbExempt.ps1
    Author: maTWed - Matt Weddle
    Date: 9/22/2020
    License: BSD 3-Clause
#>

function usbexempt
{
<#
    .AUTHOR
        maTWed - Matt Weddle
        9/22/2020
        
    .SYNOPSIS
        Quickly move machines into USB Exempt
    
    .EXAMPLE
        . .\usbexempt
        usbexempt -Machine "MACHINE_NAME" -Location "Final-OU"

    .NOTES
        SPECIFIC to Company AD OU Location
#>

param($Machine, $Location)
    "Machine Name: " + $Machine
    "OU Destination: " + $Location

$Loc = "OU="+$Location
$TargetOU = $Loc + ",OU=USBExempt,DC+DOAMIN,DC=LOCAL"

Get-ADComputer $Machine | Move-ADObject -TargetPath "$TargetOU"
}

function noexempt
{
<#
    .AUTHOR
        maTWed - Matt Weddle
        9/22/2020

    .SYNOPSIS
        Quickly move machines out of USB Exempt

    .EXAMPLE
        noexempt -Machine "MACHINE_NAME" -Location "Final-OU"

    .NOTES
        SPECIFIC to Company AD OU Location
#>

param($Machine, $Location)
    "Machine Name: " + $Machine
    "OU Destination: " + $Location

$Loc = "OU=" + $Location
$TargetOU = $Loc + ",OU=Domain Computers,DC=DOMAIN,DC=LOCAL"

Get-ADComputer $Machine | Move-ADObject -TargetPath "$TargetOU"
}
