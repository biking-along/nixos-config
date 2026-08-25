{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.hardware.networking;
in {
  options = {
    modules.shared.all.hardware.networking = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal networking settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    networking.networkmanager.enable = mkDefault true;
    networking.wireless = {
      enable = mkDefault true;
      enableHardening = false;
    };
  };
}
