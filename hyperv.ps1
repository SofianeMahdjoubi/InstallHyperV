$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
  -Argument '-NoProfile -WindowStyle Hidden -command "Set-Disk -Number 2 -IsOffline $true; New-VM -Name Level2VM -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\Level2VM" | Add-VMHardDiskDrive -DiskNumber 2;Disable-ScheduledTask -TaskName "CreateLevel2VM";"'
$trigger =  New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CreateLevel2VM" -Description "Create Level 2 VM in Hyper-V for troubleshooting"
