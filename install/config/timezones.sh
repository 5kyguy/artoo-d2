#!/bin/bash

# Set default timezone to IST (Asia/Kolkata)
sudo timedatectl set-timezone Asia/Kolkata

# Ensure timezone can be updated without needing to sudo
sudo tee /etc/sudoers.d/r2-d2-tzupdate >/dev/null <<EOF
%wheel ALL=(root) NOPASSWD: /usr/bin/tzupdate, /usr/bin/timedatectl
EOF
sudo chmod 0440 /etc/sudoers.d/r2-d2-tzupdate
