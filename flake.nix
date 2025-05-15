{
  description = "wfv top level flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    mac-app-util.url = "github:hraban/mac-app-util";

    nixvim.url = "github:markusfossdal/nixvim-config";
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

    darwinPkgs = import nixpkgs {
      system = darwinSystem;
      config.allowUnfree = true;
    };
    linuxPkgs = import nixpkgs {
      system = linuxSystem;
      config.allowUnfree = true;
    };
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

          home-manager.users."mf" = {
            imports = [
              (import ./configuration/home-manager/apps {
                pkgs = darwinPkgs;
                inherit inputs;
              })
              (import ./configuration/home-manager/darwin/default.nix {
                pkgs = darwinPkgs;
              })
              (import ./configuration/home-manager/fonts.nix {
                pkgs = darwinPkgs;
              })
              (import ./configuration/home-manager/sh.nix {
                pkgs = darwinPkgs;
              })
              (import ./configuration/home-manager/dotfiles_darwin {
                pkgs = darwinPkgs;
              })
              (import ./configuration/home-manager/system.nix {
                pkgs = darwinPkgs;
                lib = darwinPkgs.lib;
              })
            ];
          };

          #pass inputs to home-manager
          home-manager.extraSpecialArgs = {inherit inputs;};
        }
      ];
    };

    # Expose nix-darwin package set and overlays
    darwinPackages = self.darwinConfigurations."mbp".pkgs;

    homeConfigurations."mf@wfv" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = linuxSystem;
        config.allowUnfree = true;
      };
      lib = linuxPkgs.lib;
      modules = [
        ./configuration/home-manager/apps
        ./configuration/home-manager/ubuntu/default.nix
        ./configuration/home-manager/fonts.nix
        ./configuration/home-manager/sh.nix
        ./configuration/home-manager/dotfiles_ubuntu
        ./configuration/home-manager/system.nix
      ];
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
