{
  lib,
  config,
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
    programs.nixcord = {
      enable = true;
      discord.enable = false;
      equibop.enable = true;
      config.plugins = {
        hideMedia.enable = true;
        equibopStreamFixes.enable = true;
        noNitroUpsell.enable = true;
        fakeNitro.enable = true;
      };
    };
  };
}
