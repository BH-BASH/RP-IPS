#!/bin/bash

##tool-info
echo "RP-IPS-pkg-installer-pacman-t-v1.0.0"
sudo pacman -Syu ; sudo -S figlet ipfetch perl-Net-IP fping
echo "インストーラを終了します"