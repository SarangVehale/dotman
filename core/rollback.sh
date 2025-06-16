#!/usr/bin/env bash
# core/rollback.sh - Rollback a file to a previous Git version

rollback_file() {
  local rel_path commit_hash

  rel_path=$(input_box "Enter the relative path of the file to rollback (e.g. .bashrc):")
  [[ -z "$rel_path" || ! -f "$DOTFILES_DIR/$rel_path" ]] && show_msg "File not found in dotfiles repo." && return

  local log_file
  log_file=$(mktemp)
  git -C "$DOTFILES_DIR" log --oneline -- "$rel_path" > "$log_file"

  if [[ ! -s "$log_file" ]]; then
    show_msg "No history found for this file."
    rm -f "$log_file"
    return
  fi

  show_textbox "$log_file"
  commit_hash=$(input_box "Enter the commit hash to rollback to:")

  if git -C "$DOTFILES_DIR" cat-file -e "$commit_hash"^{commit} 2>/dev/null; then
    git -C "$DOTFILES_DIR" checkout "$commit_hash" -- "$rel_path"
    show_msg "Rolled back '$rel_path' to $commit_hash."
  else
    show_msg "Invalid commit hash."
  fi

  rm -f "$log_file"
}

