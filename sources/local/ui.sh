#!/data/data/com.termux/files/usr/bin/bash
. "$SCRIPT_DIR/tools/util.sh"

# images_path
u_input=$(get_input "text" "Local: Enter path for wallpapers (from Internal memory)" "Pictures")
config_set "images_path" "$HOME/storage/shared/$u_input"