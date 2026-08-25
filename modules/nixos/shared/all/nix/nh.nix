{
  lib,
  username,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.nh;
in {
  options.modules.shared.all.nix.nh = {
    enable = mkOption {
      default = true;
      type = types.bool;
      description = ''
        Enable universal nh settings
      '';
    };
  };
  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/${username}/NixOS/nixos-config";
    };
  };
}
