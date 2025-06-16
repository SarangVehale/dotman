#!/usr/bin/env bash
# install.sh - Installer for dotman

set -e

DOTMAN_TARGET="$HOME/.dotman"

echo "🔧 Installing dotman to $DOTMAN_TARGET..."

# 1. Copy project files
mkdir -p "$DOTMAN_TARGET"
cp -r core utils extras menu.sh config.sh dotman.sh "$DOTMAN_TARGET"

# 2. Create default config
CONFIG_FILE="$HOME/.dotmanrc"
if [[ ! -f "$CONFIG_FILE" ]]; then
  cat > "$CONFIG_FILE" <<EOF
# ~/.dotmanrc
DOTFILES_DIR=\$HOME/.dotfiles
USE_SYMLINKS=true
AUTO_COMMIT=true
EOF
  echo "✅ Default config created at $CONFIG_FILE"
else
  echo "📄 Config file already exists: $CONFIG_FILE"
fi

# 3. Set up shell alias if not present
SHELL_RC=""
[[ -f "$HOME/.bashrc" ]] && SHELL_RC="$HOME/.bashrc"
[[ -f "$HOME/.zshrc" ]] && SHELL_RC="$HOME/.zshrc"

if [[ -n "$SHELL_RC" ]] && ! grep -q 'alias dotman=' "$SHELL_RC"; then
  echo "alias dotman='$DOTMAN_TARGET/dotman.sh'" >> "$SHELL_RC"
  echo "✅ Added alias to $SHELL_RC"
  echo "🔁 Run 'source $SHELL_RC' or restart your shell to use 'dotman'"
else
  echo "ℹ️  Alias already exists or no shell rc file found."
fi

echo "✅ Installation complete! Run 'dotman' to launch the manager."

