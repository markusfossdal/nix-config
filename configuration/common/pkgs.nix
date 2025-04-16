{pkgs, ...}: {
  # Common nixpkgs
  environment.systemPackages = with pkgs; [
    git
  ];
}
