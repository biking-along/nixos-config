{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.systemPkgs;
in {
  options = {
    modules.shared.all.software.systemPkgs = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal system packages.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      git-crypt
      curl
      wget
      gawk
      cbonsai
      openssl
      patchelfUnstable
      wakeonlan
    ];
  };
}
