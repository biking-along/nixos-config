{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.hardware.printing;
in {
  options = {
    modules.shared.workstation.hardware.printing = {
      enable = mkOption {
        type = types.bool;
        description = ''
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
