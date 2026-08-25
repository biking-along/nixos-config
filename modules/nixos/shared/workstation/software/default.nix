{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.software;
in {
  imports = [
    ./steam.nix
  ];
  options = {
    modules.shared.workstation.software = {
      enable = mkOption {
        type = types.bool;
        description = ''
          Enable systemwide software configs for workstations.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    modules.shared.workstation.software.gaming.enable = lib.mkDefault true;
    programs.firefox.enable = lib.mkDefault true;
  };
}
