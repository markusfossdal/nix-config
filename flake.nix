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

    nixvim.url = "/Users/mf/nixvim-config";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-homebrew,
    mac-app-util,
    nixvim,
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
          pkgs = darwinPkgs;
          nix-homebrew = nix-homebrew;
          mac-app-util = mac-app-util;
        })

        # common
        ./configuration/common

        # darwin
        ./configuration/darwin

        # home-manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Fixes home-manager spotlight search
          home-manager.sharedModules = [
            mac-app-util.homeManagerModules.default
          ];

          # home-manager.extraSpecialArgs = specialArgs;
          home-manager.users."mf" = import ./configuration/home-manager;

          #pass inputs to home-manager
          home-manager.extraSpecialArgs = {inherit inputs;};
        }
      ];
    };

    # Expose nix-darwin package set and overlays
    darwinPackages = self.darwinConfigurations."mbp".pkgs;
  };
}
