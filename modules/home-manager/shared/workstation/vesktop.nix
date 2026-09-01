{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.vesktop;
in {
  options.homeModules.shared.workstation.vesktop.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable vesktop.
    '';
  };
  config = mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
    };
  };
}
