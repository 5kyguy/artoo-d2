#!/bin/bash

# R2-D2 logo font for Waybar (optional; skip if not in repo)
mkdir -p ~/.local/share/fonts
if [[ -f ~/.local/share/r2-d2/config/r2-d2.ttf ]]; then
  cp ~/.local/share/r2-d2/config/r2-d2.ttf ~/.local/share/fonts/
  fc-cache -f
fi
