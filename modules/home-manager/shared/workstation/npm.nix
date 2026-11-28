{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.npm;
in {
  options.homeModules.shared.workstation.npm.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable npm.
    '';
  };
  config = mkIf cfg.enable {
    programs.npm = {
      enable = true;
    };
  };
}
