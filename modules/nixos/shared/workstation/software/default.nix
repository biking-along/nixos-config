{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.workstation.software;
in {
  imports = [
    ./steam.nix
    ./taildrive.nix
    ./tofinoDAV.nix
  ];
  options = {
    modules.shared.workstation.software = {
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
    modules.shared.workstation = {
      software = {
        steam.enable = lib.mkDefault true;
        taildrive.enable = lib.mkDefault true;
        tofinoDAV.enable = lib.mkDefault true;
      };
    };
    programs.firefox.enable = lib.mkDefault true;
  };
}
