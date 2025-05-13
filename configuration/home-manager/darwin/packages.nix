{pkgs, ...}: {
  home.packages = with pkgs; [
    youtube-music
    vlc-bin
    discord
    vscode
    google-chrome
  ];
}
