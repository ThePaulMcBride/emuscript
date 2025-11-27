#!/usr/bin/env bash
set -e

CENTRAL_DIR="$HOME/Games/Emulation/saves"

# Eden configuration
EDEN_SRC=(
  "$CENTRAL_DIR/Eden/nand/user/save"
  "$CENTRAL_DIR/Eden/nand/system/save"
)
EDEN_TARGET="$HOME/.local/share/eden"

# Cemu configuration
CEMU_SRC=(
  "$CENTRAL_DIR/Cemu/mlc01/usr/save"
)
CEMU_TARGET="$HOME/.local/share/Cemu"

# Azahar configuration
AZAHAR_SRC=(
  "$CENTRAL_DIR/Azahar/sdmc"
)
AZAHAR_TARGET="$HOME/.local/share/azahar-emu"

echo "Starting symlink creation..."

create_symlinks() {
  local target_root=$1
  shift
  local srcs=("$@")

  for src in "${srcs[@]}"; do
    rel_path="${src#"$CENTRAL_DIR"/}"
    target="$target_root/${rel_path#*/}" # Remove emulator name from rel_path
    # If target exists and is not a symlink, warn and exit
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "ERROR: Target exists and is not a symlink: $target"
      exit 1
    fi
    # If target is a broken symlink, remove it
    if [ -L "$target" ] && [ ! -e "$target" ]; then
      echo "Removing broken symlink: $target"
      rm "$target"
    fi
    # Ensure parent directory exists
    mkdir -p "$(dirname "$target")"
    # Create symlink if missing
    if [ ! -e "$target" ]; then
      ln -s "$src" "$target"
      echo "Created symlink: $target -> $src"
    fi
  done
}

create_symlinks "$EDEN_TARGET" "${EDEN_SRC[@]}"
create_symlinks "$CEMU_TARGET" "${CEMU_SRC[@]}"
create_symlinks "$AZAHAR_TARGET" "${AZAHAR_SRC[@]}"

echo "Symlink creation complete!"
