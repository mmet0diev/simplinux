#!/bin/bash

# 1. Update system metadata and packages
echo "🚀 Updating system..."
sudo dnf upgrade --refresh -y

# 2. Install everything in one optimized command
echo "🛠️ Installing applications..."
sudo dnf install -y \
    libreoffice \
    wine \
    lutris \
    wireshark \
    aircrack-ng \
    nmap \
    shotcut \
    steam \
    obs-studio \
    tor \
    gimp

# 3. Install Virtualization Suite (KVM/QEMU)
# Fedora uses group installs for virtualization which is much cleaner
echo "💻 Setting up Virtualization..."
sudo dnf groupinstall "Virtualization" -y
sudo dnf install -y virt-manager virtinst bridge-utils

# 4. Finalizing Wireshark (Adding your user to the group so you don't need sudo)
sudo usermod -a -G wireshark $USER

echo "✅ All software installed successfully!"
