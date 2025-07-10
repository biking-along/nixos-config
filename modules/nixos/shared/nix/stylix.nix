{pkgs, ...}: {
  stylix = {
    enable = true;
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
  };
}
