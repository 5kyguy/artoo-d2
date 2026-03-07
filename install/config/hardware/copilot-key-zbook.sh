#!/bin/bash

# HP ZBook (e.g. Ultra G1a): remap Copilot key to Right Ctrl via keyd.
# On these machines the Copilot key sends left-meta + left-shift (within ~2 ms), not F23.
# So we map leftshift+leftmeta → rightcontrol. Caveat: real Shift+Win will also act as Right Ctrl.

if [[ ! -f /sys/class/dmi/id/product_name ]]; then
  exit 0
fi
if ! grep -qi zbook /sys/class/dmi/id/product_name; then
  exit 0
fi

r2-d2-pkg-add keyd

sudo mkdir -p /etc/keyd
sudo tee /etc/keyd/default.conf >/dev/null <<'EOF'
[ids]
*

[main]
# Copilot on some machines (kernel 6.14+): F23+Shift+Meta
f23+leftshift+leftmeta = rightcontrol
# Copilot on HP ZBook (firmware): Shift+Meta only, no F23
leftshift+leftmeta = rightcontrol
EOF

sudo systemctl enable --now keyd

# Treat keyd's virtual keyboard as internal so touchpad palm rejection still works
sudo mkdir -p /etc/libinput
QUIRKS=/etc/libinput/local-overrides.quirks
if ! grep -q 'keyd virtual keyboard' "$QUIRKS" 2>/dev/null; then
  sudo tee -a "$QUIRKS" >/dev/null <<'QUIRK'

[Serial Keyboards]
MatchUdevType=keyboard
MatchName=keyd virtual keyboard
AttrKeyboardIntegration=internal
QUIRK
  sudo udevadm control --reload-rules
  sudo udevadm trigger
fi
