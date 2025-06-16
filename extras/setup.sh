#!/usr/bin/env bash
# extras/setup.sh - Initial setup wizard for new environments

initial_setup() {
  local repo_url use_symlinks

  repo_url=$(input_box "Enter Git repository URL for your dotfiles:")
  [[ -z "$repo_url" ]] && show_msg "Setup cancelled." && return

  if [[ -d "$DOTFILES_DIR/.git" ]]; then
    show_msg "Dotfiles repo already exists at $DOTFILES_DIR"
  else
    git clone "$repo_url" "$DOTFILES_DIR" || {
      show_msg "Failed to clone repository!"
      return
    }
  fi

  use_symlinks=$(dialog --yesno "Use symlinks instead of copying files?" 7 50; echo $?)

  if [[ "$use_symlinks" -eq 0 ]]; then
    sed -i 's|USE_SYMLINKS=.*|USE_SYMLINKS=true|' "$DOTMAN_CONFIG"
  else
    sed -i 's|USE_SYMLINKS=.*|USE_SYMLINKS=false|' "$DOTMAN_CONFIG"
  fi

  # Apply dotfiles
  "$DOTMAN_DIR/core/sync.sh" sync_to_home

  show_msg "Setup complete. Dotfiles synced to home directory."
}

