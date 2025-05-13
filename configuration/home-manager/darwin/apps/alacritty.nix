{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 1.0;
        padding = {
          x = 5;
          y = 5;
        };
      };

      font = {
        size = 16.0;
        normal.family = "JetBrainsMono Nerd Font";
      };

      colors = {
        primary = {
          background = "0x1e1e2e";
          foreground = "0xcdd6f4";
        };
        normal = {
          black = "0x45475a";
          red = "0xf38ba8";
          green = "0xa6e3a1";
          yellow = "0xf9e2af";
          blue = "0x89b4fa";
          magenta = "0xf5c2e7";
          cyan = "0x94e2d5";
          white = "0xbac2de";
        };
        bright = {
          black = "0x585b70";
          red = "0xf38ba8";
          green = "0xa6e3a1";
          yellow = "0xf9e2af";
          blue = "0x89b4fa";
          magenta = "0xf5c2e7";
          cyan = "0x94e2d5";
          white = "0xa6adc8";
        };
      };
    };
  };
}
