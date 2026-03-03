#!/bin/bash

# Copy bundled icons to applications/icons (skip if repo has no applications/icons)
ICON_DIR="$HOME/.local/share/applications/icons"
mkdir -p "$ICON_DIR"
cp ~/.local/share/r2-d2/applications/icons/*.png "$ICON_DIR/"
