{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        zsh
        oh-my-zsh
        neovim
        ripgrep
        fzf
        bat
        zoxide
        eza
      ];
    };
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "zsh-autosuggestions"
      ];
    };
  };
}
