#!/bin/bash

# Set links for Nautilus action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Single-theme setup: UI/themes/colors/fonts are applied once via config/ and default/.
# No theme-set or subsequent scripted theme changes.

# Set default background once (first image in backgrounds/)
if [[ -n ${R2D2_PATH:-} ]] && [[ -d "$R2D2_PATH/backgrounds" ]]; then
  first_bg=$(find "$R2D2_PATH/backgrounds" -maxdepth 1 -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) 2>/dev/null | head -1)
  if [[ -n $first_bg ]]; then
    ln -nsf "$first_bg" "$R2D2_PATH/background"
  fi
fi

rm -rf ~/.config/chromium/SingletonLock

# Add managed policy directories for Chromium and Brave (used by system policy, not theme switching)
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed
sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
