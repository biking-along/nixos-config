{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.mpv;
in {
  options.homeModules.shared.workstation.mpv.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable mpv.
    '';
  };
  config = mkIf cfg.enable {
    programs.mpv = {
      enable = true;
    };
  };
}
