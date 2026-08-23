{
  lib,
  pkgs,
  ...
}: {
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
    opacity.terminal = 0.8;
    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-catppuccin-mocha-dark";
      size = 24;
    };
    targets.qt.platform = lib.mkForce "qtct";
  };
}
