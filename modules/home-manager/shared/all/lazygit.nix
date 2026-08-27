{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.lazygit;
in {
  options.homeModules.shared.all.lazygit.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable lazygit.
    '';
  };
  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
