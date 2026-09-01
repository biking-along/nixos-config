{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.hardware;
in {
  imports = [
    ./bluetooth.nix
    ./printing.nix
  ];
  options = {
    modules.shared.workstation.hardware = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enable hardware options and settings specific to my workstations.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    modules.shared.workstation.hardware.bluetooth.enable = lib.mkDefault true;
    modules.shared.workstation.hardware.printing.enable = lib.mkDefault true;
  };
}
