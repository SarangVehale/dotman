#!/usr/bin/env bash
# core/git.sh - Git helper functions

git_status() {
  git -C "$DOTFILES_DIR" status
}

git_log() {
  git -C "$DOTFILES_DIR" log --oneline --graph --all
}

git_commit() {
  local msg="$1"
  git -C "$DOTFILES_DIR" add .
  git -C "$DOTFILES_DIR" commit -m "${msg:-'Manual commit'}"
}

git_push() {
  git -C "$DOTFILES_DIR" push
}

git_pull() {
  git -C "$DOTFILES_DIR" pull --rebase
}

git_set_remote() {
  local url="$1"
  git -C "$DOTFILES_DIR" remote add origin "$url"
}

git_change_remote() {
  local url="$1"
  git -C "$DOTFILES_DIR" remote set-url origin "$url"
}

