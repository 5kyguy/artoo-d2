#!/bin/bash

# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use bashrc from config
cp ~/.config/bashrc ~/.bashrc
