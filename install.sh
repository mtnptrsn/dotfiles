#!/bin/bash
set -e
DOTFILES=$(pwd -P)

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

install_essential_packages () {
  sudo apt-get update
  sudo apt-get install -y \
    curl \
    git \
    software-properties-common \
    ninja-build \
    gettext \
    cmake \
    unzip \
    build-essential \
    fzf \
    ripgrep \
    clang \
    exa \
    htop
}

install_nodejs () {
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash
  sudo apt-get install -y nodejs
}

install_zoxide () {
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
}

install_neovim () {
  CURRENT_DIR=$(pwd)
  cd /tmp
  git clone --branch v0.9.5 --depth 1 https://github.com/neovim/neovim.git
  cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd /tmp && rm -rf neovim
  cd $CURRENT_DIR
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
}

install_zsh () {
  sudo apt-get install -y zsh
  touch ~/.zshrc
}

install_oh_my_zsh () {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    --keep-zshrc \
    --skipchsh \
    --unattended

  # install plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

install_essential_packages
install_zsh
install_nodejs
install_zoxide
install_neovim
install_dotfiles
create_env_file
install_oh_my_zsh
echo ''
success 'All installed!'
