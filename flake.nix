{
  description = "Top level flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-homebrew,
    mac-app-util,
    ...
  }: let
    darwinSystem = "aarch64-darwin";
    linuxSystem = "x86_64-linux";

    darwinPkgs = import nixpkgs {system = darwinSystem;};
    linuxPkgs = import nixpkgs {system = linuxSystem;};
  in {
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      system = darwinSystem;
      pkgs = darwinPkgs;
      modules = [
        # host specific
        (import ./hosts/mac.nix {
          self = self;
          nix-homebrew = nix-homebrew;
          mac-app-util = mac-app-util;
        })
        
	# common
        ./configuration/common/pkgs.nix
        ./configuration/common/fonts.nix
        
	# darwin
        ./configuration/darwin/system_settings.nix
        ./configuration/darwin/brew.nix
 
 	# home-manager
        (import ./configuration/home-manager/mac.nix {hm = home-manager;})
        (import ./configuration/home-manager/common.nix {pkgs = darwinPkgs; hm = home-manager;})
      ];
    };

    # Expose nix-darwin package set and overlays
    darwinPackages = self.darwinConfigurations."mbp".pkgs;
  };
}
