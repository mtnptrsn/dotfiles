# Tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Neovim
brew install neovim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

# Apps
brew install --cask discord
brew install --cask google-chrome
brew install --cask 1password
brew install --cask docker

# Misc
brew install exa
brew install alacritty

# App Store
brew install mas

# Flow (Pomodoro Timer)
mas install 1423210932

brew cleanup
