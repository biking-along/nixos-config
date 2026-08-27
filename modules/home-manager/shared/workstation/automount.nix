{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.automount;
in {
  options.homeModules.shared.workstation.automount.enable = mkOption {
    type = types.bool;
    description = ''
      Enable automounting inserted drives.
    '';
  };
  config = mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "auto";
    };
  };
}
