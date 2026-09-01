{
  lib,
  config,
  host,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.hardware.bluetooth;
in {
  options = {
    modules.shared.workstation.hardware.bluetooth = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
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
