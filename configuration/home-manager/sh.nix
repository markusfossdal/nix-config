{ pkgs, ... }:
let
  commonShellAliases = {
    linkpreset = "ln -sfv /home/mf/Dropbox/synced/dev/ros2_ws/CMakePresets.json .";
    lg = "lazygit";
    ls = "lsd -F --icon never";
    cat = ''bat'';
    fzf = ''
      selected="$(
                  	find . \( -path './.git' -o -path './node_modules' -o -path './dist' \) -prune -o -type f -print |
                  	command fzf --preview 'bat --style=numbers --color=always {}'
                	)"
                	[ -n "$selected" ] && nvim "$selected"'';
  };

  commonSessionVariables = {
    # SHELL = "${builtins.getEnv "HOME"}/.nix-profile/bin/zsh";
    SHELL = "${pkgs.zsh}/bin/zsh";
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
    ROS_DOMAIN_ID = "16";
    # PATH="$HOME/.cargo/bin:$PATH";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    sessionVariables = commonSessionVariables;
    shellAliases = commonShellAliases;

    oh-my-zsh = {
      enable = true;

      theme = "robbyrussell";
      # oh-my-zsh plugins
      plugins = [
        "git"
        "z"
        "fzf"
      ];
    };
  };

  programs.bash = {
    enable = true;
    sessionVariables = commonSessionVariables;
    shellAliases = commonShellAliases;
    # initExtra = ''
    #   exec zsh
    # '';
  };

  # admin of .inputrc
  programs.readline = {
    enable = true;
    extraConfig = ''
      set match-hidden-files on
    '';
  };
}
