#!/bin/bash

# Install build tools
r2-d2-pkg-add base-devel

# Configure pacman (always stable mirror)
sudo cp -f ~/.local/share/r2-d2/default/pacman/pacman.conf /etc/pacman.conf
sudo cp -f ~/.local/share/r2-d2/default/pacman/mirrorlist /etc/pacman.d/mirrorlist

sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

sudo pacman -Sy
r2-d2-pkg-add omarchy-keyring

# Refresh all repos
sudo pacman -Syyuu --noconfirm
