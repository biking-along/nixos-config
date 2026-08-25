{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.stylix;
in {
  options = {
    modules.shared.all.nix.stylix = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal stylix settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      homeManagerIntegration = {
        autoImport = true;
        followSystem = true;
      };
      enableReleaseChecks = false;
      image = ./nix-mocha.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      polarity = "dark";
      opacity.terminal = 1.0;
      cursor = {
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-catppuccin-mocha-dark";
        size = 24;
      };
      targets.qt.platform = lib.mkForce "qtct";
    };
  };
}
