{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.fish;
in {
  options.homeModules.shared.all.fish.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable fish home module.
    '';
  };
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = "fastfetch";
    };
  };
}
