{
  pkgs,
  inputs,
  ...
}:
{

  home.packages = with pkgs; [
    # --- DEV toolchain
    llvmPackages.clang
    llvmPackages.lld
    llvmPackages.llvm
    clang-tools
    cmake-language-server
    cmake
    python312Full
    nodejs
    rustc # rust toolchain
    cargo # rust toolchain
    rust-analyzer # rust toolchain
    clippy # rust toolchain
    eigen # c++ lib
    # --- APPS
    yazi
    inputs.nixvim.packages.${pkgs.system}.default # includes nixvim
    lsd
    ripgrep
    bat
    btop
    fzf
    wget
    tree
    lazygit
    git
    curl
  ];
}
