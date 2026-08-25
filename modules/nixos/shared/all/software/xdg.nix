{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.xdg;
in {
  options = {
    modules.shared.all.software.xdg = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal xdg settings
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    xdg = {
      terminal-exec = {
        enable = true;
        settings = {
          default = [
            "kitty.desktop"
          ];
          GNOME = [
            "com.mitchellh.ghostty.desktop"
          ];
        };
      };
    };
  };
}
