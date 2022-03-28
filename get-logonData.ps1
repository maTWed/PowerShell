# Get DCs
$DCs = Get-ADDomainController -Filter *

# Define time
$startDate = (get-date).AddDays(-1)

#Store sucessful logon events from security logs
foreach ($DC in $DCs){
$getlogonevents = Get-Eventlog -LogName Security -ComputerName $DC.Hostname -after $startDate | where {$_.eventID -eq 4624 }}

# Crawl through events; print all logon history

for each ($e in $getlogonevents){
    if (($e.EventID -eq 4628 ) -and ($e.ReplacementStrings[8] -eq 2)){
        write-host "Type: Local Logon`tDate:
        "$e.TimeGenerated "`tStatus: Success`tUser:
        "$e.ReplacementStrings[5] "`tWorkstation:
        "$e.ReplacementStrings[11]
        }
    if (($e.EventID -eq 4624 ) -and (e$.ReplacementStrings[8] -eq 10)){
        write-host "Type: Remote Logon`tDate:
        "$e.TimeGenerated "`tStatus: Success'tUser:
        "$e.ReplacementStrings[5] "`tWorkstation:
        "$e.ReplacementStrings[11] "`tIP Address:
        "$e.ReplacementStrings[18]
        }
    }
