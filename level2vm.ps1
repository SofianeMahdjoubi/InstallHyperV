try {New-VM -Name $VMName -MemoryStartupBytes 3GB -Generation 1 -Path "C:\Virtual Machines\$VMName" -ErrorAction SilentlyContinue | Add-VMHardDiskDrive -DiskNumber 2}
catch {}