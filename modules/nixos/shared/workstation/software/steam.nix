{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.software.gaming;
in {
  options = {
    modules.shared.workstation.software.gaming.enable = mkOption {
      type = types.bool;
      description = ''
        Enable steam with extras like proton-ge-bin
      '';
    };
  };
  config = mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;
        extraCompatPackages = with pkgs; [proton-ge-bin];
        protontricks.enable = true;
      };
      gamescope = {
        enable = true;
        capSysNice = true;
      };
      gamemode = {
        enable = true;
      };
    };
    # hardware.xpadneo.enable = true;
  };
}
