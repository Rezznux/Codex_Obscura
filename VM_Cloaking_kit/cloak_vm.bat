@echo off
:: VM Name
set VM_NAME=FLAREVM

echo [*] Cloaking VirtualBox VM: %VM_NAME%

:: Spoof System Manufacturer and Product
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" "Dell Inc."
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemProduct" "XPS 15 9570"
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVersion" "1.0.0"
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "1.12.1"

:: Spoof Serial Numbers
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "WD-WX21A66R1234"
VBoxManage setextradata "%VM_NAME%" "VBoxInternal/Devices/ahci/0/Config/Port0/FirmwareRevision" "82.00A82"

:: Spoof MAC address
VBoxManage modifyvm "%VM_NAME%" --macaddress1 080027D14C66

:: Disable drag & drop and clipboard sharing
VBoxManage modifyvm "%VM_NAME%" --clipboard disabled
VBoxManage modifyvm "%VM_NAME%" --draganddrop disabled

:: Disable audio and USB for stealth
VBoxManage modifyvm "%VM_NAME%" --audio none
VBoxManage modifyvm "%VM_NAME%" --usb off

:: Enable hardware virtualization
VBoxManage modifyvm "%VM_NAME%" --nested-hw-virt on

echo [*] Cloaking complete.
pause
