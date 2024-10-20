{
  description = "Example Darwin system flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };
  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
      configuration = { pkgs, config, ... }: {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages =
          [
            pkgs.neovim
            # pkgs.tmux
            pkgs.mkalias
            pkgs.git
            pkgs.eza
            pkgs.nodejs_20
            pkgs.zoxide
            pkgs.rustup
            pkgs.ripgrep
            pkgs.fzf
            pkgs.fira-code
            pkgs.pipx
          ];
        fonts.packages = [
          (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
        ];
        homebrew = {
          enable = true;
          casks = [
            "google-chrome"
            "discord"
            "1password"
            "spotify"
            "alfred"
            "alacritty"
            "obsidian"
            "docker"
            "trezor-suite"
            "transmission"
          ];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };
        services.nix-daemon.enable = true;
        nix.settings.experimental-features = "nix-command flakes";
        programs.zsh.enable = true; # default shell on catalina
        programs.tmux = {
	        enable = true;
        };
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 5;
        nixpkgs.hostPlatform = "aarch64-darwin";
        system.activationScripts.applications.text =
          let
            env = pkgs.buildEnv {
              name = "system-applications";
              paths = config.environment.systemPackages;
              pathsToLink = "/Applications";
            };
          in
          pkgs.lib.mkForce ''
            	  # Set up applications.
            	  echo "setting up /Applications..." >&2
            	  rm -rf /Applications/Nix\ Apps
            	  mkdir -p /Applications/Nix\ Apps
            	  find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
            	  while read src; do
            	    app_name=$(basename "$src")
            	    echo "copying $src" >&2
            	    ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            	  done
            	      '';
        system.defaults = {
          dock.autohide = true;
          NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
          universalaccess.reduceMotion = true;
        };
      };
    in
    {
      darwinConfigurations."mtnptrsn" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "mtnptrsn";
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations."mtnptrsn".pkgs;
    };
}
