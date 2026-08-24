{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.workstation.hardware;
in {
  imports = [
    ./bluetooth.nix
    ./printing.nix
  ];
  options = {
    workstation.hardware = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = lib.mdDoc ''
          Enable hardware options and settings specific to my workstations.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    config.workstation.hardware.bluetooth.enable = lib.mkDefault true;
    config.workstation.hardware.printing.enable = lib.mkDefault true;
  };
}
