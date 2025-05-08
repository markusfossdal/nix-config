{pkgs, ...}: {
  home.packages = with pkgs; [
    rectangle
  ];

  # Mac specific home-manager settings
  home.stateVersion = "24.11";
  home.username = "mf";
  home.homeDirectory = "/Users/mf";

  home.file = {
    # "/.config/alacritty".source = "/Users/mf/dotfiles/alacritty";
    # "/.config/nvim".source = "/Users/mf/dotfiles/nvim";
  };
}
