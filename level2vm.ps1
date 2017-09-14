"select disk 2", "offline disk" | diskpart
try {New-VM -Name Level2VM -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\Level2VM" -ErrorAction SilentlyContinue | Add-VMHardDiskDrive -DiskNumber 2}
catch {}