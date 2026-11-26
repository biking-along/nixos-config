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
    programs.tmux = let
      smart-splits-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "smart-splits";
        version = "unstable";
        src = inputs.smart-splits-backend-tmux;
        rtpFilePath = "smart-splits.tmux";
        extraConfig = ''
          set -g @plugin "smart-splits-nvim/backend-tmux"
          set -g @smart-splits_at_edge "wrap"
          set -g @smart-splits_move_left_key  "C-h"
          set -g @smart-splits_move_down_key  "C-j"
          set -g @smart-splits_move_up_key    "C-k"
          set -g @smart-splits_move_right_key "C-l"
          set -g @smart-splits_resize_left_key  "M-h"
          set -g @smart-splits_resize_down_key  "M-j"
          set -g @smart-splits_resize_up_key    "M-k"
          set -g @smart-splits_resize_right_key "M-l"
          set -g @smart-splits_resize_step_size "3"
          set -g @smart-splits_at_edge 'split'
        '';
      };
    in {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";
      extraConfig = ''
        set -as terminal-features ",xterm*:RGB"
        set -as terminal-features ",xterm*:usstyle"
        set -g focus-events on
        set -s set-clipboard on
      '';
      plugins = [
        smart-splits-tmux
      ];
    };
  };
}
