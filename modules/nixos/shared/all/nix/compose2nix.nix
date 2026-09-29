{
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.compose2nix;
in {
  options.shared.all.nix.compose2nix = {
    enable = mkOption {
      default = true;
      type = types.bool;
      description = ''
        Enable compose2nix system package.
      '';
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.compose2nix.packages.x86_64-linux.default
    ];
  };
}
