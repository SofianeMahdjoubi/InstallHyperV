"select disk 2", "offline disk" | diskpart
Write-Host "Hyper-V is not Enabled. Installing and Enabling Hyper-V..."
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
Restart-Computer