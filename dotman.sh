#!/usr/bin/env bash
# dotman.sh - Entry point for Dotman

DOTMAN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTMAN_DIR

# Load core modules
source "$DOTMAN_DIR/config.sh"
source "$DOTMAN_DIR/utils/dialog.sh"
source "$DOTMAN_DIR/menu.sh"

