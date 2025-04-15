{
  config,
  pkgs,
  lib,
  ...
}: {
  # Common nixpkgs
  environment.systemPackages = with pkgs; [
    # rustup
    rectangle
    # neovim
    alacritty
    nerd-fonts.jetbrains-mono
    vlc-bin
    bat
    btop
    fzf
    wget
    tree
    # zsh
    llvmPackages.clang
    llvmPackages.lld
    llvmPackages.llvm
    nmap
    nodejs
    alejandra #nvim formatter
    # tmux
  ];
}
