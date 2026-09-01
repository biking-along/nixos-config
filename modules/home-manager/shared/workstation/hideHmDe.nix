{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.hideHmDe;
in {
  options.homeModules.shared.workstation.hideHmDe.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable the hiding of desktop entries for specific programs.
    '';
  };
  config = mkIf cfg.enable {
    xdg.desktopEntries = {
      fish = {
        name = "fish";
        noDisplay = true;
      };
      yazi = {
        name = "yazi";
        noDisplay = true;
      };
    };
  };
}
