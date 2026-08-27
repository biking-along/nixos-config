{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.eza;
in {
  options.homeModules.shared.all.eza.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable eza with settings.
    '';
  };
  config = mkIf cfg.enable {
    programs = {
      eza = {
        enable = true;
        enableFishIntegration = true;
        git = true;
        colors = "auto";
        icons = "auto";
      };
    };
  };
}
