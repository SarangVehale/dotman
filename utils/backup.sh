#!/usr/bin/env bash
# utils/backup.sh - Backup and restore functionality

BACKUP_DIR="$HOME/.dotman_backups"

make_backup() {
  local ts backup_path
  ts=$(date +"%Y%m%d_%H%M%S")
  backup_path="$BACKUP_DIR/backup_$ts"

  mkdir -p "$backup_path/home"
  mkdir -p "$backup_path/repo"

  rsync -a --exclude ".git" "$HOME/" "$backup_path/home/"
  rsync -a "$DOTFILES_DIR/" "$backup_path/repo/"

  show_msg "Backup created at: $backup_path"
}

list_backups() {
  find "$BACKUP_DIR" -maxdepth 1 -type d -name "backup_*" | sort -r
}

restore_backup() {
  local backup_dir chosen
  mapfile -t backups < <(list_backups)
  if [[ ${#backups[@]} -eq 0 ]]; then
    show_msg "No backups found."
    return
  fi

  local options=()
  for b in "${backups[@]}"; do
    options+=("$b" "")
  done

  chosen=$(dialog --menu "Choose a backup to restore" 15 60 5 "${options[@]}" 3>&1 1>&2 2>&3)
  [[ -z "$chosen" ]] && return

  rsync -a "$chosen/home/" "$HOME/"
  rsync -a "$chosen/repo/" "$DOTFILES_DIR/"

  show_msg "Backup restored from: $chosen"
}

