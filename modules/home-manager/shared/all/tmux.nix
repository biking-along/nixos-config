{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.tmux;
in {
  options.homeModules.shared.all.tmux.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable universal tmux settings.
    '';
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";
      baseIndex = 1;
      extraConfig = ''
        unbind C-b
        set -g prefix C-s
        bind C-s send-prefix
        set -as terminal-features ",xterm*:RGB"
        set -as terminal-features ",xterm*:usstyle"
        set -s extended-keys on
        set -as terminal-features ",xterm*:extkeys"
        setw -g allow-passthrough on
        set -g focus-events on
        set -s set-clipboard on
        set -g set-titles-string "#S / #W"
        set -g renumber-windows on
        set -g history-limit 50000
        set -g display-time 2000
        set -s focus-events on
        set -g set-titles on
        setw -g monitor-activity on
        bind r source-file ~/.config/tmux/tmux.conf \; display-message "~/.config/tmux/tmux.conf reloaded"
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
        setw -g copy-mode-line-numbers absolute
        setw -g pane-scrollbars auto-hide
        set -g status-interval 5
        setw -g pane-border-lines heavy
        set -g window-status-current-style default
        set -g session-status-current-style default
      '';
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.mkTmuxPlugin {
            pluginName = "smart-splits";
            version = "unstable";
            src = inputs.smart-splits-backend-tmux;
            rtpFilePath = "smart-splits.tmux";
          };
          extraConfig = ''
            set -g @smart-splits_at_edge "split"
            set -g @smart-splits_move_left_key  "C-h"
            set -g @smart-splits_move_down_key  "C-j"
            set -g @smart-splits_move_up_key    "C-k"
            set -g @smart-splits_move_right_key "C-l"
            set -g @smart-splits_resize_left_key  "M-h"
            set -g @smart-splits_resize_down_key  "M-j"
            set -g @smart-splits_resize_up_key    "M-k"
            set -g @smart-splits_resize_right_key "M-l"
            set -g @smart-splits_resize_step_size "3"
          '';
        }
        # {
        #   plugin = tmuxPlugins.resurrect;
        #   extraConfig = ''
        #     set -g @resurrect-strategy-nvim 'session'
        #     set -g @resurrect-capture-pane-contents 'on'
        #   '';
        # }
        {
          plugin = tmuxPlugins.dotbar;
          extraConfig = ''
            set -g @tmux-dotbar-bg "#1e1e2e"
            set -g @tmux-dotbar-fg "#585b70"
            set -g @tmux-dotbar-fg-current "#cdd6f4"
            set -g @tmux-dotbar-fg-session "#9399b2"
            set -g @tmux-dotbar-fg-prefix "#cba6f7" 
            set -g @tmux-dotbar-bold-current-window true
            set -g @tmux-dotbar-rounded true
          '';
        }
        # {
        #   plugin = tmuxPlugins.continuum;
        #   extraConfig = ''
        #     set -g @continuum-restore 'on'
        #     set -g @continuum-save-interval '10`
        #   '';
        # }
      ];
    };
  };
}
