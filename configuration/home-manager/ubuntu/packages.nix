{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake # build system
    ninja # build system
    xclip # x11 clipboard
  ];
}
