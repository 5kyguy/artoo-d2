#!/bin/bash

# Install all base packages (official repos first, then AUR)
mapfile -t packages < <(grep -v '^#' "$R2D2_INSTALL/r2-d2-base.packages" | grep -v '^$')
r2-d2-pkg-add "${packages[@]}"

mapfile -t aur_packages < <(grep -v '^#' "$R2D2_INSTALL/r2-d2-base.aur.packages" | grep -v '^$')
if [[ ${#aur_packages[@]} -gt 0 ]]; then
  r2-d2-pkg-aur-add "${aur_packages[@]}"
fi

# Voxtype dictation: download model and enable systemd (config is in config phase)
if command -v voxtype &>/dev/null; then
  voxtype setup --download --no-post-install
  voxtype setup systemd
fi
