#!/bin/bash

##tool-info
echo "RP-IPS-pkg-installer-apt-v1.0.0"
sudo apt update ; sudo apt upgrade ; sudo apt install figlet ipfetch perl-Net-IP fping
echo "インストーラを終了します"