{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        zsh
        zinit
        neovim
        ripgrep
        fzf
        bat
        zoxide
        eza
        nodejs_20
      ];
    };
  };
}
