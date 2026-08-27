{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.zathura;
in {
  options.homeModules.shared.workstation.zathura.enable = mkOption {
    type = types.bool;
    description = ''
      Enable zathura.
    '';
  };
  config = mkIf cfg.enable {
    programs.zathura = {
      enable = true;
    };
  };
}
