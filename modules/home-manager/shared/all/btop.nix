{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.btop;
in {
  options.homeModules.shared.all.btop.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable btop with settings.
    '';
  };
  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = lib.mkDefault true;
      };
    };
  };
}
