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
  };

  home.shellAliases = {
    cat = ''bat'';
    fzfnvim = ''nvim "$(find . -type f | fzf --preview 'bat --style=numbers --color=always {}')" '';
    fzfview = ''find . -type f | fzf --preview 'bat --style=numbers --color=always {}' '';
    fzfgrepnvim = ''nvim "$(grep -rn . | fzf --preview "bat --style=numbers --color=always {1} --highlight-line {2}" --delimiter : --nth 3.. | cut -d: -f1,2)"'';
  };
}
