{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.nixcord;
in {
  options.homeModules.shared.workstation.nixcord.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable Nixcord Home Manager configuration.
    '';
  };
  config = mkIf cfg.enable {
    inputs = [inputs.nixcord.homeModules.nixcord];
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      config.plugins.hideMedia.enable = true;
    };
  };
}
