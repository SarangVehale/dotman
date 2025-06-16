#!/usr/bin/env bash
# core/sync.sh - Sync dotfiles between $HOME and dotfiles repo

sync_to_repo() {
  rsync -avh --no-perms --exclude ".git" "$HOME/" "$DOTFILES_DIR/" --delete

  if [[ "$AUTO_COMMIT" == true ]]; then
    git -C "$DOTFILES_DIR" add .
    git -C "$DOTFILES_DIR" commit -m "Sync from home to repo on $(date '+%Y-%m-%d %H:%M:%S')" || true
  fi

  show_msg "Synced files from \$HOME to dotfiles repository."
}

sync_to_home() {
  rsync -avh --no-perms --exclude ".git" "$DOTFILES_DIR/" "$HOME/" --delete

  show_msg "Synced files from dotfiles repository to \$HOME."
}

