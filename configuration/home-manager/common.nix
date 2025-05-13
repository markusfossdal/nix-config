{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    yazi
    tmux
    inputs.nixvim.packages.${pkgs.system}.default #includes nixvim
    lsd
    ripgrep
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
    clang-tools
    cmake-language-server
    cmake
    nodejs
    alejandra #nvim formatter
    lazygit
    git
  ];
}
