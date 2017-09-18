$dir = (Get-Item -Path ".\" -Verbose).FullName
$stscriptpath = "$dir\scheduled.ps1"
$createscript = @"
Set-Disk -Number 2 -IsOffline `$true
New-VM -Name Level2VM -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\Level2VM" | Add-VMHardDiskDrive -DiskNumber 2
Disable-ScheduledTask -TaskName "CreateLevel2VM"
"@
$createscript |Out-file $stscriptpath -force

$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "-NoProfile -WindowStyle Hidden $stscriptpath"
$trigger = New-ScheduledTaskTrigger -AtStartUp
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CreateLevel2VM" -Description "Create Level 2 VM in Hyper-V for troubleshooting" -Principal $principal

Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart  
Restart-Computer
