# R2-D2

R2-D2 is 5kyguy’s own config and setup on top of **Arch Linux** — a modern, opinionated desktop and tooling layer. This project uses **only the curl method** — no ISO. You install, update, and repair your laptops with the same command every time.

**Target hardware:** AMD CPU + GPU, HP/Dell laptops. English only.

## Prerequisites

Install Arch Linux using archinstall, with the following options:

| Section | Option |
| ------- | ------ |
| Disk > File system | btrfs (default structure: yes + use compression) |
| Disk > Disk encryption | Encryption type: LUKS + Encryption password + Partitions (select the one) |
| Bootloader | Limine |
| Applications | Audio: pipewire |

## Installation (and update / repair)

Install, update, or repair is always done the same way — **online only**, from a running Arch system:

```bash
curl -fsSL https://raw.githubusercontent.com/5kyguy/artoo-d2/refs/heads/dev/boot.sh | bash
```

This will:

1. **Bootstrap (boot.sh)** — Set the stable mirror (`stable-mirror.omarchy.org`), update pacman, install git, remove any existing `~/.local/share/r2-d2/`, clone `5kyguy/artoo-d2` from the `dev` branch, then source `install.sh`
2. **Run the installer** — Execute the full pipeline (preflight → packaging → config → login → post-install)

The installer does **not** verify prerequisites (Arch Linux, x86_64, Btrfs root, Limine, Secure Boot off, no GNOME/KDE). Ensure they are met before running.

### Installation Phases (install.sh)

**Phase 1 — Preflight** (`install/preflight/all.sh`)

- **begin.sh** — Clear screen, show “Installing…”, start install log
- **pacman.sh** — Install base-devel; copy pacman.conf and mirrorlist; import Omarchy key, install omarchy-keyring; full sync and upgrade (`pacman -Syyuu`)
- **migrations.sh** — Prepare migration state directory; migrations run at end of install (r2-d2-migrate)
- **first-run-mode.sh** — Create first-run marker and sudoers entries for post-login cleanup
- **disable-mkinitcpio.sh** — Temporarily disable mkinitcpio hooks during package install

**Phase 2 — Packaging** (`install/packaging/all.sh`)

- **base.sh** — Install all packages from `install/r2-d2-base.packages` (pacman) and, if present, `install/r2-d2-base.aur.packages` (AUR via yay). See `docs/PACKAGE-LIST.md` for what is installed. Runs `voxtype setup` if Voxtype is present.
- **helium.sh** — Install Helium AppImage (webapps)
- **dev-runtimes.sh** — Go (official tarball to /usr/local) and Node.js (nvm)
- **fonts.sh** — Copy R2-D2 font (r2-d2.ttf) to `~/.local/share/fonts`, run fc-cache
- **nvim.sh** — No-op; Neovim uses omarchy-nvim package + theme from config
- **icons.sh** — Copy bundled icons to `~/.local/share/applications/icons`
- **webapps.sh** — Create web app shortcuts (WhatsApp, YouTube, X, Discord) via Helium when available
- **tuis.sh** — Add TUI shortcuts (Disk Usage, Docker)

**Phase 3 — Config** (`install/config/all.sh`)

- **config.sh** — Copy repo `config/*` to `~/.config/`, default bashrc to `~/.bashrc`
- **theme.sh** — Theme/background setup, Chromium policy dirs
- **branding.sh** — Copy logo for fastfetch/screensaver
- **git, gpg, timezones** — User/config defaults
- **increase-sudo-tries, increase-lockout-limit, ssh-flakiness, increase-file-watchers** — System tweaks
- **detect-keyboard-layout, xcompose** — Input
- **docker.sh, flatpak.sh** — Container/flatpak config
- **mimetypes.sh** — Default apps (e.g. Brave as browser)
- **walker-elephant.sh, fast-shutdown.sh, input-group.sh** (plocate DB: run `r2-d2-update-locate` when needed)
- **voxtype.sh** — Copy Voxtype config to `~/.config/voxtype/`
- **kernel-modules-hook.sh, powerprofilesctl-rules.sh, wifi-powersave-rules.sh**
- **hardware/** — network, wireless regdom, Bluetooth, printer, USB autosuspend, power button, Vulkan (AMD), Synaptics touchpad

**Phase 4 — Login** (`install/login/all.sh`)

- **plymouth.sh** — Boot splash
- **default-keyring.sh** — Default keyring setup
- **sddm.sh** — SDDM display manager
- **limine-snapper.sh** — Limine + Snapper (when limine present)

**Phase 5 — Post-install** (`install/post-install/all.sh`)

- **pacman.sh** — Final pacman.conf and mirrorlist
- **r2-d2-migrate** — Run pending migrations (idempotent; safe on first install and re-run)
- **allow-reboot.sh** — Sudoers for reboot
- **finished.sh** — Stop log, show logo and install time, remove reboot sudoers, prompt to reboot now

## Themes

Single theme only: colors and look are set once via config. To change the wallpaper, use the background selector (**Super + Ctrl + Space**).

## Install / Remove / Update

- **Full install, update, or repair** — Re-run the same curl command from a running Arch system to clone the latest repo and run the installer again.
- **In-session update** — `r2-d2-update` (git pull + snapshot + package updates)
- **Reinstall** — `r2-d2-reinstall` (reinstall packages and reset default configs)
- **Install package** — `r2-d2-pkg-add <pkg>`, or use the menu (Install → Package / AUR / etc.)
- **Remove package** — `r2-d2-pkg-remove`, or menu (Remove → …)
