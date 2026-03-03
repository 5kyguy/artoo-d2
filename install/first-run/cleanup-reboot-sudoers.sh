#!/bin/bash

if sudo test -f /etc/sudoers.d/99-r2-d2-installer-reboot; then
  sudo rm -f /etc/sudoers.d/99-r2-d2-installer-reboot
fi
