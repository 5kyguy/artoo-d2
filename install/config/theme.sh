#!/bin/bash

# Apply GNOME/GTK dark theme (file explorer, dialogs, etc.) so it persists across install/update
bash "${R2D2_PATH:-$HOME/.local/share/r2-d2}/install/first-run/gnome-theme.sh"

# Set links for Nautilus action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Set default background once (Omarchy Matte Black)
ln -nsf "$R2D2_PATH/backgrounds/omarchy-matte-black.jpg" "$R2D2_PATH/background"

rm -rf ~/.config/chromium/SingletonLock

# Add managed policy directories for Chromium and Brave (used by system policy, not theme switching)
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed
sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
