$dir = (Get-Item -Path ".\" -Verbose).FullName
$stscriptpath = "$dir\scheduled.ps1"
$createscript = @"
Set-Disk -Number 2 -IsOffline `$true
New-VM -Name Level2VM -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\Level2VM" | Add-VMHardDiskDrive -DiskNumber 2
Disable-ScheduledTask -TaskName "CreateLevel2VM"
"@
$createscript |Out-file $stscriptpath -force
