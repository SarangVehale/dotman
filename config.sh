#!/usr/bin/env bash
# config.sh - Load config and setup environment

# Default values
DEFAULT_DOTFILES_DIR="$HOME/.dotfiles"
DEFAULT_AUTO_COMMIT=true
DEFAULT_USE_SYMLINKS=true

DOTMAN_CONFIG="$HOME/.dotmanrc"

load_config() {
  # Create config if it doesn't exist
  if [[ ! -f "$DOTMAN_CONFIG" ]]; then
    cat <<EOF > "$DOTMAN_CONFIG"
# Dotman Configuration
DOTFILES_DIR="$DEFAULT_DOTFILES_DIR"
USE_SYMLINKS=$DEFAULT_USE_SYMLINKS
AUTO_COMMIT=$DEFAULT_AUTO_COMMIT
EOF
  fi

  # Source the config
  source "$DOTMAN_CONFIG"

  # Fallbacks if variables are unset
  DOTFILES_DIR="${DOTFILES_DIR:-$DEFAULT_DOTFILES_DIR}"
  USE_SYMLINKS="${USE_SYMLINKS:-$DEFAULT_USE_SYMLINKS}"
  AUTO_COMMIT="${AUTO_COMMIT:-$DEFAULT_AUTO_COMMIT}"

  export DOTFILES_DIR USE_SYMLINKS AUTO_COMMIT

  # Create repo dir if not exists
  mkdir -p "$DOTFILES_DIR"
  if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
    git init "$DOTFILES_DIR" &>/dev/null
  fi
}

load_config

