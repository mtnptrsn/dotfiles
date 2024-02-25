source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh

export PATH=$PATH:$DOTFILES/scripts
export PATH=$PATH:$HOME/.cargo/bin/
export PATH="$PATH:$HOME/.local/bin"
export ZSH="$HOME/.oh-my-zsh"
export TERM=screen-256color

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source_if_exists $ZSH/oh-my-zsh.sh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/git.zsh

precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(zoxide init zsh)"
