{
  host,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.workstation.hardware.bluetooth;
in {
  options = {
    workstation.hardware.bluetooth = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = lib.mdDoc ''
          Enable bluetooth with settings for workstations
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Name = "${host}";
        };
      };
    };
  };
}
