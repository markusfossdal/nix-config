{
  pkgs,
  inputs,
  ...
}: {
  # Common home-manager settings

  # packages
  programs.tmux.enable = true;
  # programs.rust.enable = true;
  # programs.neovim.enable = true;

  programs.alacritty.enable = true;
  # programs.yazi.enable = true;

  home.packages = with pkgs; [
    yazi
    inputs.nixvim.packages.${pkgs.system}.default #includes nixvim
    lsd
    youtube-music
    ripgrep
    vlc-bin
    rustup
    nerd-fonts.jetbrains-mono
    bat
    btop
    fzf
    wget
    tree
    llvmPackages.clang
    llvmPackages.lld
    llvmPackages.llvm
    nmap
    nodejs
    alejandra #nvim formatter
    lazygit
    discord
    vscode
    google-chrome
  ];

  #config with options:
  # programs.SOFTWARE = {
  #   enable = true;
  # };
}
