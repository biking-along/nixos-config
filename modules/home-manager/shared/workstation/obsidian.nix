{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.obsidian;
in {
  options.homeModules.shared.workstation.obsidian.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable obsidian.
    '';
  };
  config = mkIf cfg.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}
