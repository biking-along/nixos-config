{
  lib,
  config,
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
      extraConfig = ''
        set -as terminal-features ",xterm*:RGB"
        set -as terminal-features ",xterm*:usstyle"
        set -g focus-events on
        set -s set-clipboard on
      '';
    };
  };
}
