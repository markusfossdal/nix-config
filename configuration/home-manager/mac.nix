{hm, ...}: {
  imports = [
    hm.outputs.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.mf = {
        # Mac specific home-manager settings
        home.stateVersion = "24.11";
        home.username = "mf";
        home.homeDirectory = "/Users/mf";

        home.file = {
          "/.config/alacritty".source = "/Users/mf/dotfiles/alacritty";
        };
      };
    }
  ];
}
