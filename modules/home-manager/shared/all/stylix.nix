{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.stylix;
in {
  options.homeModules.shared.all.stylix.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable stylix home settings.
    '';
  };
  config = mkIf cfg.enable {
    home.pointerCursor.enable = true;
    stylix = {
      enableReleaseChecks = false;
    };
  };
}
