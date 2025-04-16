{pkgs, ...}: {
  # Common home-manager settings

  # packages
  programs.tmux.enable = true;
  # programs.rust.enable = true;
  programs.neovim.enable = true;
  programs.alacritty.enable = true;

  home.packages = with pkgs; [
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
  ];

  #config with options:
  # programs.SOFTWARE = {
  #   enable = true;
  # };
}
