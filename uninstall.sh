#!/usr/bin/env bash
# uninstall.sh - Remove dotman from system

set -e

DOTMAN_DIR="$HOME/.dotman"
CONFIG_FILE="$HOME/.dotmanrc"
ALIAS_LINE="alias dotman="

echo "⚠️  This will remove Dotman and its configuration from your system."
read -p "Are you sure? (y/N): " confirm
[[ "$confirm" != "y" && "$confirm" != "Y" ]] && echo "❌ Cancelled." && exit 0

# Remove dotman directory
if [[ -d "$DOTMAN_DIR" ]]; then
  rm -rf "$DOTMAN_DIR"
  echo "🗑️  Removed $DOTMAN_DIR"
fi

# Remove config file
if [[ -f "$CONFIG_FILE" ]]; then
  rm -f "$CONFIG_FILE"
  echo "🗑️  Removed $CONFIG_FILE"
fi

# Remove alias from shell files
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [[ -f "$rc" && $(grep -c "$ALIAS_LINE" "$rc") -gt 0 ]]; then
    sed -i.bak "/$ALIAS_LINE/d" "$rc"
    echo "🧹 Cleaned alias from $rc"
  fi
done

echo "✅ Dotman uninstalled successfully."
echo "🔁 Restart your terminal to apply changes."

