{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.imv;
in {
  options.homeModules.shared.workstation.imv.enable = mkOption {
    type = types.bool;
    description = ''
      Enable imv.
    '';
  };
  config = mkIf cfg.enable {
    programs.imv = {
      enable = true;
    };
  };
}
