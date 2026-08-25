{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.software.fonts;
in {
  options = {
    modules.shared.all.software.fonts = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable universal font settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    fonts = {
      fontconfig = {
        enable = true;
      };
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        font-awesome
        symbola
        material-icons
        fira-code
        fira-code-symbols
        nerd-fonts.jetbrains-mono
        nerd-fonts.dejavu-sans-mono
        dejavu_fonts
      ];
    };
  };
}
