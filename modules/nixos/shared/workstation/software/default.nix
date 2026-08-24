{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.workstation.software;
in {
  imports = [
    ./steam.nix
  ];
  options = {
    workstation.software = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enable systemwide software configs for workstations.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    config.workstation.software.gaming.enable = lib.mkDefault true;
    config.programs.firefox.enable = lib.mkDefault true;
  };
}
