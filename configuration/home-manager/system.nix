{pkgs, ...}: {
  home.packages = with pkgs; [
    # rectangle
  ];

  # Mac specific home-manager settings
  home.stateVersion = "24.11";

  home.username = "mf";
  home.homeDirectory =
    if pkgs.stdenv.isDarwin
    then "/Users/mf"
    else "/home/mf";
  #  home.backupFileExtension = "backup";
  home.file = {
    # "/.config/alacritty".source = "/Users/mf/dotfiles/alacritty";
    # "/.config/nvim".source = "/Users/mf/dotfiles/nvim";
  };
}
