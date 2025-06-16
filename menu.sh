#!/usr/bin/env bash
# menu.sh - Main TUI menu and dispatcher

# Load all core and utility modules
source "$DOTMAN_DIR/core/add.sh"
source "$DOTMAN_DIR/core/list.sh"
source "$DOTMAN_DIR/core/sync.sh"
source "$DOTMAN_DIR/core/rollback.sh"
source "$DOTMAN_DIR/core/git.sh"

source "$DOTMAN_DIR/utils/dialog.sh"
source "$DOTMAN_DIR/utils/verify.sh"
source "$DOTMAN_DIR/utils/backup.sh"
source "$DOTMAN_DIR/extras/setup.sh"

main_menu() {
  require_dialog

  while true; do
    choice=$(show_menu "Dotman - Dotfiles Manager" \
      1 "Add Dotfile" \
      2 "List Dotfiles" \
      3 "Sync Home → Repo" \
      4 "Sync Repo → Home" \
      5 "Rollback File" \
      6 "Verify Dotfiles" \
      7 "Make Backup" \
      8 "Restore Backup" \
      9 "Setup Wizard" \
      0 "Exit")

    case "$choice" in
      1) add_dotfile ;;
      2) list_dotfiles ;;
      3) sync_to_repo ;;
      4) sync_to_home ;;
      5) rollback_file ;;
      6) verify_dotfiles ;;
      7) make_backup ;;
      8) restore_backup ;;
      9) initial_setup ;;
      0) clear; break ;;
    esac
  done
}

