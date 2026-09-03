{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.libreoffice;
in {
  options.homeModules.shared.workstation.libreoffice.enable = mkOption {
    default = false;
    type = types.bool;
    description = ''
      Enable libreoffice for workstations
    '';
  };
  config = mkIf cfg.enable {
    programs.libreoffice = {
      enable = true;
    };
  };
}
