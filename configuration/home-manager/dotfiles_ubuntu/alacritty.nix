{config, ...}: {
  #alacritty
  home.file = {
    "/.config/alacritty/alacritty.toml".text = ''
      [shell]
      program = "zsh" 
      args = ["--login"]

      [colors.bright]
        black = "0x585b70"
        blue = "0x89b4fa"
        cyan = "0x94e2d5"
        green = "0xa6e3a1"
        magenta = "0xf5c2e7"
        red = "0xf38ba8"
        white = "0xa6adc8"
        yellow = "0xf9e2af"

        [colors.normal]
        black = "0x45475a"
        blue = "0x89b4fa"
        cyan = "0x94e2d5"
        green = "0xa6e3a1"
        magenta = "0xf5c2e7"
        red = "0xf38ba8"
        white = "0xbac2de"
        yellow = "0xf9e2af"

        [colors.primary]
        background = "0x1e1e2e"
        foreground = "0xcdd6f4"

        [font]
        size = 12.0
        [font.normal]
        family = "JetBrainsMono Nerd Font"

        [window]
        opacity = 1.0

        [window.padding]
        x = 5
        y = 5
    '';
  };
}
