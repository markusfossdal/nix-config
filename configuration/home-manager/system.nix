{
  pkgs,
  lib,
  ...
}: {

  home.stateVersion = "24.11";

  home.username = "mf";
  home.homeDirectory =
    if pkgs.stdenv.isDarwin
    then "/Users/mf"
    else "/home/mf";

  # home.activation.rustup = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   export CARGO_HOME=$HOME/.cargo
  #   export RUSTUP_HOME=$HOME/.rustup
  #
  #   if ! ${pkgs.rustup}/bin/rustup show >/dev/null 2>&1; then
  #     echo "Installing stable toolchain with rustup"
  #     ${pkgs.rustup}/bin/rustup set profile minimal
  #     ${pkgs.rustup}/bin/rustup default stable
  #   fi
  # '';

}
