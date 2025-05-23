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
    alejandra # nvim formatter
    rustup
    # --- APPS
    dysk
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
