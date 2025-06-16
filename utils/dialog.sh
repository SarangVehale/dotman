#!/usr/bin/env bash
# utils/dialog.sh - Wrapper functions for dialog

require_dialog() {
  if ! command -v dialog &>/dev/null; then
    echo "Error: 'dialog' is required but not installed." >&2
    exit 1
  fi
}

show_msg() {
  local msg="$1"
  dialog --msgbox "$msg" 7 50
}

input_box() {
  local prompt="$1"
  dialog --inputbox "$prompt" 8 60 3>&1 1>&2 2>&3
}

show_textbox() {
  local content="$1"
  dialog --textbox "$content" 20 70
}

show_menu() {
  local title="$1"
  shift
  dialog --menu "$title" 15 60 6 "$@" 3>&1 1>&2 2>&3
}

