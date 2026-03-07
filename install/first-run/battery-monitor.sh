#!/bin/bash

if r2-d2-battery-present; then
  powerprofilesctl set balanced || true

  # Enable battery monitoring timer for low battery notifications
  systemctl --user enable --now r2-d2-battery-monitor.timer
else
  powerprofilesctl set performance || true
fi
