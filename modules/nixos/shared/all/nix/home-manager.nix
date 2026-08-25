{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.home-manager;
in {
  options = {
    modules.shared.all.nix.home-manager = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal home-manager module settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
