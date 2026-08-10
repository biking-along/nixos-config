{pkgs, ...}: {
  environment.systemPackages = [pkgs.gnomeExtensions.gjs-osk];
  services.displayManager.generic.environment.XDG_DATA_DIRS = ":${pkgs.gnomeExtensions.gjs-osk}/share:";
  services.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      [org.gnome.shell]
      enabled-extensions=[ '${pkgs.gnomeExtensions.gjs-osk.extensionUuid}' ]
    '';
  };
}
