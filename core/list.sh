#!/usr/bin/env bash
# core/list.sh - List all managed dotfiles

list_dotfiles() {
  local list_file
  list_file=$(mktemp)

  (
    cd "$DOTFILES_DIR" || exit
    find . -type f -not -path './.git/*' > "$list_file"
  )

  if [[ -s "$list_file" ]]; then
    show_textbox "$list_file"
  else
    show_msg "No dotfiles tracked yet."
  fi

  rm -f "$list_file"
}

