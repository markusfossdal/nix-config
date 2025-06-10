{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Homebrew packages for mac
  homebrew = {
    enable = true;
    brews = [
      "mas" # used to search for mac app store ids
    ];
    casks = [
      "dropbox"
      "microsoft-teams"
      "microsoft-outlook"
      "spotify"
      "microsoft-auto-update"
      "logi-options+"
      "1password"
      "adobe-acrobat-reader"
    ];
    masApps = {
      # "Yoink" = 457622435;
    };
    #ensures only declarative brew apps are installed.
    #apps installed imperatively are deleted.
    onActivation.cleanup = "zap";

    #ensures auto update and upgrade on darwin rebuild
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
