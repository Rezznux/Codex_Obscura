#!/bin/bash
# Linux VM cloaking for REMnux or Ubuntu-based VMs

echo "[*] Starting Linux VM stealth hardening..."

# Change hostname to look like a real system
sudo hostnamectl set-hostname workstation-ubuntu

# Add benign user files to mimic normal activity
mkdir -p ~/Documents ~/Pictures ~/Downloads
touch ~/Documents/resume_2023.docx
touch ~/Downloads/bank_statement.pdf
touch ~/Pictures/family_photo.jpg

# Remove common malware analysis tools
tools=(ghidra radare2 strace ltrace tcpdump wireshark yara)
for tool in "${tools[@]}"; do
    if command -v $tool &> /dev/null; then
        echo "[*] Removing $tool"
        sudo apt-get remove --purge -y $tool
    fi
done

# Disable virtual device identifiers (optional advanced)
# sudo modprobe -r vmhgfs vmw_balloon vmci vboxguest

echo "[*] Linux VM hardening complete. Reboot recommended."
