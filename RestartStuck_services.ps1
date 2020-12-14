#Get current Process ID of Stucked Services
$ServiceName = 'Windows Update' #sample service Name is windows update / but alway check for the server name
# you can change this 

# $ServiceName = 'wuauserv' = wuauserv is server name

$id = gwmi Win32_services -Filter "Name Like '$ServiceName' " | select -expand ProcessId

#Stop related process ID
Sto-Process -id $id -Force

#Start Service
Get-Service "ServiceName" | start-service

#Check current status
Get-Service "$ServiceName"

#always check for the server name