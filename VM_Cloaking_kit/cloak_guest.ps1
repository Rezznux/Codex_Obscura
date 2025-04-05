# Cloak Guest OS (run inside VM)
Write-Host "[*] Disabling network interfaces for stealth..."
Get-NetAdapter | Disable-NetAdapter -Confirm:$false

Write-Host "[*] Setting benign hostname and username..."
Rename-Computer -NewName "DESKTOP-7128XD2" -Force
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName' -Name "ComputerName" -Value "DESKTOP-7128XD2"

Write-Host "[*] Faking user presence (requires restart)..."
New-Item -Path "C:\Users\Public\Pictures\vacation.jpg" -ItemType File
New-Item -Path "C:\Users\Public\Documents\taxes_2023.xlsx" -ItemType File
