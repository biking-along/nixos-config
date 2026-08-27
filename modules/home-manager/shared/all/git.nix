{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.git;
in {
  options.homeModules.shared.all.git.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable git with settings.
    '';
  };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "biking-along";
          email = "bikingalong@pm.me";
        };
      };
    };
  };
}
