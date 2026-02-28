# Preinstall Voxtype dictation (non-interactive; same steps as omarchy-voxtype-install)
omarchy-pkg-add wtype voxtype-bin

mkdir -p ~/.config/voxtype
cp "$OMARCHY_PATH/default/voxtype/config.toml" ~/.config/voxtype/

voxtype setup --download --no-post-install
voxtype setup systemd
