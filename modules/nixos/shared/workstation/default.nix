{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation;
in {
  imports = [
    ./hardware
    ./software
  ];
  options = {
    modules.shared.workstation = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enable options and settings specific to workstations
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    modules.shared.workstation.software.enable = lib.mkDefault true;
    modules.shared.workstation.hardware.enable = lib.mkDefault true;
  };
}
