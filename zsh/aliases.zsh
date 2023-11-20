alias vim="nvim"
alias pip="pip3"
alias python="python3"
alias rgf="rg --files | rg"
alias ls="exa"
alias docker-logs-watch="watch 'docker ps -q | xargs -L 1 docker logs'"
alias docker-ps-watch="watch 'docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Ports}}\"'"
alias home="cd $HOME"
alias neorg="cd $HOME/Neorg && nvim ."
alias dotfiles="cd $HOME/.dotfiles && nvim ."
