#!/bin/bash

# Copy bundled icons to applications/icons (skip if repo has no applications/icons)
ICON_DIR="$HOME/.local/share/applications/icons"
mkdir -p "$ICON_DIR"
if [[ -d ~/.local/share/r2-d2/applications/icons ]] && compgen -G ~/.local/share/r2-d2/applications/icons/*.png &>/dev/null; then
  cp ~/.local/share/r2-d2/applications/icons/*.png "$ICON_DIR/"
fi
