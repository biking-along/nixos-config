{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.homePkgs;
in {
  options.homeModules.shared.all.homePkgs.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable the list of shared home packages.
    '';
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      cbonsai
      cmatrix
      socat
      play
    ];
  };
}
