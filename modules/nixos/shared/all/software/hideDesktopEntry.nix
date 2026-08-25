{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.hideDesktopEntry;
in {
  options = {
    modules.shared.all.software.hideDesktopEntry = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal settings to hide unnecessary desktop entries.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    documentation.nixos.enable = false;
  };
}
