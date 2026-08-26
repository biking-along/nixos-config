{
  lib,
  config,
  inputs,
  username,
  state,
  host,
  system,
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
      extraSpecialArgs = {inherit inputs username state host system;};
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
