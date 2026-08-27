{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.bat;
in {
  options.homeModules.shared.all.bat.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable bat with extras.
    '';
  };
  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
      extraPackages = with pkgs.bat-extras; [
        batman
        batpipe
        # batgrep
      ];
    };
  };
}
