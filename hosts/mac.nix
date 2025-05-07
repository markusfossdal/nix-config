{
  self,
  pkgs,
  nix-homebrew,
  mac-app-util,
  ...
}: {
  # Packages that needs manual installation
  #xcode (triggered by git pull the first time)

  imports = [
    # homebrew
    nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        # enableRosetta=true;
        user = "mf";
      };
    }

    # mac-app-util for apps spotlight search
    mac-app-util.darwinModules.default
  ];

  #home folder and default shell
  users.users.mf = {
    home = "/Users/mf";
    shell = pkgs.zsh;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Allow unfree software to be installed
  nixpkgs.config.allowUnfree = true;

  #Sets rust toolchain to stable version
  # This script will run at activation time
  system.activationScripts.rustup = {
    text = ''
      export HOME=/Users/mf
      if ! rustup show >/dev/null 2>&1; then
      	 echo "Installing stable toolchain with rustup"
      	 rustup default stable
      fi
    '';
  };
}
