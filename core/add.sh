#!/usr/bin/env bash
# core/add.sh - Add a file to the dotfiles repo

add_dotfile() {
  local file rel_path target_path

  file=$(input_box "Enter the full path to the file you want to manage:")
  [[ -z "$file" || ! -f "$file" ]] && show_msg "Invalid or missing file!" && return

  rel_path="${file/#$HOME\//}"  # Path relative to home dir
  target_path="$DOTFILES_DIR/$rel_path"

  mkdir -p "$(dirname "$target_path")"

  if [[ "$USE_SYMLINKS" == true ]]; then
    mv "$file" "$target_path"
    ln -s "$target_path" "$file"
  else
    cp "$file" "$target_path"
  fi

  git -C "$DOTFILES_DIR" add "$rel_path"

  if [[ "$AUTO_COMMIT" == true ]]; then
    git -C "$DOTFILES_DIR" commit -m "Add $rel_path"
  fi

  show_msg "Dotfile '$rel_path' added and tracked."
}

