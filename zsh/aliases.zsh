alias vim="nvim"
alias pip="pip3"
alias python="python3"
alias rgf="rg --files | rg"
alias ls="exa"

neorg () {
  cd $HOME/Neorg/
  nvim .
}

dotfiles () {
  cd $HOME/.dotfiles/
  nvim .
}
