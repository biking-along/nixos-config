{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.homeModules.shared.workstation.gtk;
in {
  options.homeModules.shared.workstation.gtk.enable = mkOption {
    type = types.bool;
    description = ''
      Enable gtk theme settings.
    '';
  };
  config = mkIf cfg.enable {
    gtk = {
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}
