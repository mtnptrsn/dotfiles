source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh

export PATH=$PATH:$DOTFILES/scripts
export PATH=$PATH:$HOME/.cargo/bin/
export PATH="$PATH:$HOME/.local/bin"
# export ZSH="$HOME/.oh-my-zsh"
export TERM=screen-256color
unset DOCKER_DEFAULT_PLATFORM

ZSH_THEME="robbyrussell"

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

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light romkatv/powerlevel10k

[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
