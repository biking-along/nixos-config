{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.nix-index;
in {
  options.homeModules.shared.all.nix-index.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable nix-index.
    '';
  };
  config = mkIf cfg.enable {
    programs.nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
