{
  config,
  pkgs,
  lib,
  ...
}: {
  system.defaults = {
    # dock
    dock.autohide = true;
    dock.tilesize = 48;
    dock.magnification = false;
    dock.largesize = 64;
    dock.orientation = "bottom"; # "left", "right", or "bottom"
    dock.persistent-apps = [
      "${pkgs.google-chrome}/Applications/Google Chrome.app"
      "${pkgs.alacritty}/Applications/Alacritty.app"
      "/System/Applications/System Settings.app"
      "/System/Applications/FindMy.app"
      "/Applications/Microsoft Teams.app"
      "/Applications/Microsoft Outlook.app"
      "/Applications/Spotify.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Notes.app"
    ];
    dock.show-recents = false;
    dock.persistent-others = [];
    dock.mru-spaces = false;

    # screen capture
    screencapture.location = "~/Downloads";

    # control center
    controlcenter.Bluetooth = true;
    controlcenter.BatteryShowPercentage = true;

    # login window
    loginwindow.GuestEnabled = false;

    # menubar
    menuExtraClock.IsAnalog = false;
    menuExtraClock.Show24Hour = true;
    menuExtraClock.ShowAMPM = false;
    menuExtraClock.ShowDate = 1; #0: when space allows, 1: always, 2:never
    menuExtraClock.ShowDayOfMonth = true;
    menuExtraClock.ShowDayOfWeek = true;
    menuExtraClock.ShowSeconds = true;

    # global options
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;

    # finder
    finder.FXPreferredViewStyle = "Nlsv"; #"clmv", "icnv", "Nlsv", "Flwv"
    finder.AppleShowAllExtensions = false;
    finder.AppleShowAllFiles = false;
    finder.FXRemoveOldTrashItems = false; #whether to remove trash after 30d or not.
    finder.ShowExternalHardDrivesOnDesktop = false;
    finder.ShowHardDrivesOnDesktop = false;
    finder.ShowMountedServersOnDesktop = false;
    finder.ShowRemovableMediaOnDesktop = false;
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;
    finder._FXShowPosixPathInTitle = true;
    finder._FXSortFoldersFirst = false; #folders ontop when sorting
    finder._FXSortFoldersFirstOnDesktop = false;

    # window manager
    WindowManager.EnableStandardClickToShowDesktop = false;

    # trackpad
    trackpad.TrackpadThreeFingerDrag = true;
    trackpad.TrackpadThreeFingerTapGesture = 0;

    # accesibility
    universalaccess.mouseDriverCursorSize = 1.0;

    # system software updates
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
  };
}
