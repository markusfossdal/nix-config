{
  config,
  pkgs,
  lib,
  ...
}: {
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
