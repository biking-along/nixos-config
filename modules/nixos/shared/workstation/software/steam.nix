{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.workstation.gaming;
in {
  options = {
    gaming.enable = mkOption {
      default = false;
      type = types.bool;
      description = lib.mdDoc ''
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
