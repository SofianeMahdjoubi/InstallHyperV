$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
  -Argument '-NoProfile -WindowStyle Hidden -command "& "select disk 2", "offline disk" | diskpart; try {New-VM -Name Level2VM -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\Level2VM" -ErrorAction SilentlyContinue | Add-VMHardDiskDrive -DiskNumber 2} catch {};Disable-ScheduledTask -TaskName "CreateLevel2VM";"'
$trigger =  New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CreateLevel2VM" -Description "Create Level 2 VM in Hyper-V for troubleshooting"

Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
Restart-Computer
