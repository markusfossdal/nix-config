{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;

      theme = "robbyrussell";
      # oh-my-zsh plugins
      plugins = ["git" "z" "fzf"];
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      exec zsh
    '';
  };

  home.shellAliases = {
    lg = "lazygit";
    ls = "lsd -F --icon never";
    cat = ''bat'';
    fzf = ''      selected="$(
            	find . \( -path './.git' -o -path './node_modules' -o -path './dist' \) -prune -o -type f -print |
            	command fzf --preview 'bat --style=numbers --color=always {}'
          	)"
          	[ -n "$selected" ] && nvim "$selected"'';
  };
}
