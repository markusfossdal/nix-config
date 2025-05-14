
{
pkgs,
  ...
}: {
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        historyLimit = 100000;
        terminal = "tmux-256color";
        extraConfig = ''
                #general
                set-option -sa terminal-overrides ',alacritty:RGB'
                set -g allow-passthrough on
                set-option -sg escape-time 10
                set-option -g focus-events on
                set -g mouse on #mouse support

                #statusbar pos
                set-option -g status-position top

                #leader key
                unbind C-b
                set -g prefix C-s

                # Start windows and panes at 1, not 0
                set -g base-index 1
                setw -g pane-base-index 1

                # Split panes using Prefix + h (horizontal) and Prefix + v (vertical)
                unbind '"'
                unbind %
                bind h split-window -v
                bind v split-window -h
                ''; 

        plugins = with pkgs; [
            tmuxPlugins.sensible
            {
                plugin = tmuxPlugins.catppuccin;
                extraConfig = ''
                set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato or mocha
                set -g @catppuccin_window_status_style "rounded"
                set -g status-right-length 100
                set -g status-left-length 200
                set -g status-left ""
                set -g status-right "#{E:@catppuccin_status_application}"
                set -ag status-right "#{E:@catppuccin_status_session}"
                set -ag status-right "#{E:@catppuccin_status_uptime}"
                set -g @catppuccin_window_default_text " #W"
                set -g @catppuccin_window_current_text " #W"
                set -g @catppuccin_window_text " #W"
                '';
            }
            {
                plugin = tmuxPlugins.vim-tmux-navigator;
                extraConfig = ''
                set -g @vim_navigator_mapping_left "C-Left C-h"  # use C-h and C-Left
                set -g @vim_navigator_mapping_right "C-Right C-l"
                set -g @vim_navigator_mapping_up "C-k"
                set -g @vim_navigator_mapping_down "C-j"
                set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding
                set -g @vim_navigator_prefix_mapping_clear_screen ""
                '';
            }
        ];

    };
}
