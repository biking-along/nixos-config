{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.workstation.hardware.printing;
in {
  options = {
    workstation.hardware.printing = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = lib.mdDoc ''
          Enable printing with settings for workstations.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    services.printing = {
      enable = true;
      openFirewall = true;
      cups-pdf.enable = true;
    };
  };
}
