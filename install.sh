#!/bin/bash
#
# bootstrap installs things.
DOTFILES=$(pwd -P)
set -e
echo ''
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}
link_file () {
  local src=$1 dst=$2
  local overwrite=true
  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]; then
    rm -rf "$dst"
    success "removed $dst"
  fi
  ln -s "$src" "$dst"
  success "linked $src to $dst"
}
install_dotfiles () {
  info 'installing dotfiles'
  find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | while read -r linkfile; do
    while read -r line; do
      local src dst dir
      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname "$dst")
      mkdir -p "$dir"
      link_file "$src" "$dst"
    done < "$linkfile"
  done
}
create_env_file () {
    if test -f "$HOME/.env.sh"; then
        success "$HOME/.env.sh file already exists, skipping"
    else
        echo "export DOTFILES=$DOTFILES" > "$HOME/.env.sh"
        success 'created ~/.env.sh'
    fi
}
install_dotfiles
create_env_file
echo ''
echo ''
success 'All installed!'
