{pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
    youtube-music
    vlc-bin
    discord
    vscode
    google-chrome
  ];
}
