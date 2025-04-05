#!/bin/bash
VM_NAME="FLAREVM"

echo "[*] Cloaking VirtualBox VM: $VM_NAME"

VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" "Dell Inc."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemProduct" "XPS 15 9570"
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVersion" "1.0.0"
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "1.12.1"

VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "WD-WX21A66R1234"
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/ahci/0/Config/Port0/FirmwareRevision" "82.00A82"

VBoxManage modifyvm "$VM_NAME" --macaddress1 080027D14C66
VBoxManage modifyvm "$VM_NAME" --clipboard disabled
VBoxManage modifyvm "$VM_NAME" --draganddrop disabled
VBoxManage modifyvm "$VM_NAME" --audio none
VBoxManage modifyvm "$VM_NAME" --usb off
VBoxManage modifyvm "$VM_NAME" --nested-hw-virt on

echo "[*] Cloaking complete."
