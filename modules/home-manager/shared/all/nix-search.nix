{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.all.nix-search;
in {
  options.homeModules.shared.all.nix-search.enable = mkOption {
    default = true;
    type = types.bool;
    description = ''
      Enable nix-search-tv;
    '';
  };
  config = mkIf cfg.enable {
    programs.nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
    };
    programs.television = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
