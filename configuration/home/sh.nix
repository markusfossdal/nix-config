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
    fzfgrep = ''nvim "+$(rg --line-number --no-heading . | fzf --preview "bat --style=numbers --color=always {1} --highlight-line {2}" --delimiter : --nth 3.. | cut -d: -f1,2)"'';
    cat = ''bat'';
    fzfnvim = ''nvim "$(find . -type f | fzf --preview 'bat --style=numbers --color=always {}')" '';
    fzfview = ''find . -type f | fzf --preview 'bat --style=numbers --color=always {}' '';
  };
}
