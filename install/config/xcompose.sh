#!/bin/bash

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run omarchy-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.config/xcompose"

# Identification
<Multi_key> <space> <n> : "5kyguy"
<Multi_key> <space> <e> : "0x5kyguy@gmail.com"
EOF
