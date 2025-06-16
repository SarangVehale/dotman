#!/usr/bin/env bash
# utils/verify.sh - Safety and verification checks

verify_dotfiles() {
  local broken_symlinks
  local missing_files
  local status_file
  status_file=$(mktemp)

  echo "🔍 Verifying dotfiles in $DOTFILES_DIR ..." > "$status_file"
  echo >> "$status_file"

  # Check for broken symlinks in $HOME
  broken_symlinks=$(find "$HOME" -type l ! -exec test -e {} \; -print 2>/dev/null)
  if [[ -n "$broken_symlinks" ]]; then
    echo "⚠️ Broken symlinks found in \$HOME:" >> "$status_file"
    echo "$broken_symlinks" >> "$status_file"
  else
    echo "✅ No broken symlinks found." >> "$status_file"
  fi

  echo >> "$status_file"

  # Check if any files tracked by git are missing
  (
    cd "$DOTFILES_DIR" || return
    missing_files=$(git ls-files --deleted)
    if [[ -n "$missing_files" ]]; then
      echo "❌ Missing files in Git repo:" >> "$status_file"
      echo "$missing_files" >> "$status_file"
    else
      echo "✅ No missing files in Git repo." >> "$status_file"
    fi
  )

  echo >> "$status_file"
  git -C "$DOTFILES_DIR" status >> "$status_file"

  show_textbox "$status_file"
  rm -f "$status_file"
}

